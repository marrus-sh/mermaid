<div align="right">
  <b><cite>ｍｅｒｍａｉｄ</cite></b><br />
  Source and Documentation<br />
  <code>Sources/Interfaces/Literal.litcoffee</code>
  <hr />
  <div align="justify">
    Copyright © 2018 Kyebego.
    Code released under GNU GPLv3 (or any later version);
      documentation released under CC BY-SA 4.0.
    For more information, see the license notice at the bottom of this
      document.
  </div>
</div>

___

#  Literals  #

>   Reference specifications:
>   + <https://www.w3.org/TR/rdf-interfaces/#literals>
>   + <http://rdf.js.org/#literal-interface>

Literal nodes represent a literal data type, like a number or a string.
ｍｅｒｍａｉｄ implements literals that reflect the data structures
  described in RDF 1.1.
This differs slightly from those implied by the RDF Interfaces spec;
  importantly, ｍｅｒｍａｉｄ literals will always have a datatype,
  and language-tagged literals will always be of type
  `http://www.w3.org/1999/02/22-rdf-syntax-ns#langString`—**not**
  `http://www.w3.org/2001/XMLSchema#string` or any other type.

ｍｅｒｍａｉｄ follows the RDF Interfaces requirement that language
  tags be converted to lower case before processing, which is allowed
  (but not required) in RDF 1.1.
Note that this means that ｍｅｒｍａｉｄ will consider case-mismatched
  language tags to be equivalent, but other RDF 1.1 processors may not.

ｍｅｒｍａｉｄ supports native JavaScript representations of more
  datatypes than are required by the RDF Interfaces spec; namely:

+ All date and time datatypes are supported.
  When not specified, dates and times default to 31 December 1972 at
    00:00:00.
  (This is the default date/time in XSD.)
  Dates and times are assumed to be in local time unless a timezone
    offset is provided.

+ `xsd:hexBinary` and `xsd:base64Binary` are converted into
    `ArrayBuffer`s on supporting platforms.
  On platforms without Typed Array support, it is left as a string.

+ `xsd:anyURI` is converted to a `URL` object on platforms with a `URL`
    constructor.
  Otherwise, it is left as a string.

##  The Constructor  ##

The `Literal` constructor takes three arguments:

+   __`value` :__
    A lexical (string) representation of the `Literal`'s value.

+   __`lang` :__
    A BCP47 language tag, provided as a string or `BCP47` instance.

+   __`datatype` :__
    A URI (as string or `RFC3987` instance) or `NamedNode` specifying
      the type of the literal.

The `lang` and `datatype` arguments are optional; if both are provided,
  the `datatype` will be ignored.

    Literal = do ->
      rdfǀlangString = new NamedNode "
        http://www.w3.org/1999/02/22-rdf-syntax-ns#langString
      "
      xsdǀstring = new NamedNode "
        http://www.w3.org/2001/XMLSchema#string
      "
      (value, lang = "", datatype = xsdǀstring) ->
        constructǃ @, Literal, "Literal"

`Literal` extends `RDFNode`, which in turn extends `Term`.

        value = if value? then do value.toString else String value
        RDFNode.call @, LITERAL, value

##  Instance Properties  ##

        Object.defineProperties @,

###  `literal.datatype`:

The `datatype` property gives the `NamedNode` identifying the literal's
  datatype.

          datatype:
            configurable: yes
            enumerable: yes
            writable: no
            value:
              if lang then rdfǀlangString
              else if type instanceof NamedNode then type
              else new NamedNode type

###  `literal.lang`:

The `lang` property gives the language tag for the literal as a `BCP47`
  object.

          lang:
            configurable: yes
            enumerable: yes
            writable: no
            value:
              if lang instanceof BCP47 then lang
              else new BCP47 lang ? ""

###  `literal.language`

The `language` property gives the language tag for the literal as a
  string.
This is normalized by downcasing.

          language:
            configurable: yes
            enumerable: yes
            writable: no
            get: ->
              if @lang then do (do @lang.toString).toLowerCase
              else ""

##  The Prototype  ##

The `Literal` prototype inherits from `RDFNode`.

    Object.defineProperty Literal, "prototype",
      writable: no
      value: Object.defineProperties Literalℙ = (
        Object.create RDFNodeℙ
      ),

##  Instance Methods  ##

###  `literal.constructor()`:

`Literal`s are not constructable by outside forces, so the
  `constructor()` method is a fake constructor which always throws a
  `TypeError`.

        constructor: value: Ø "Literal", Literalℙ

###  `literal.equals(other)`:

When checking equality of `Literal`s, we need to check their `language`
  and `datatype` in addition to their `termType` and `value`.

        equals: value: (other) ->
          if @ instanceof Literal and other instanceof Literal
            @interfaceType is other.interfaceType and
            @nominalValue is other.nominalValue and
            (@language ? "") is (other.language ? "") and
            Termℙ.equals.call @datatype, other.datatype
          else Termℙ.equals.call @, other

###  `literal.toNT()`:

The `toNT()` method wraps the `nominalValue` in double quotes, and then
  appends the `language` tag or `datatype` to the end, according to the
  conventions of N-Triples.
Of course, we will have to escape some characters as well.

        toNT: value: do ->

The `uesc()` function will turn a number into a string, padded with
  the appropriate number of zeros to be four or eight digits long.
Four-digit numbers are prefixed with `\u`, and eight-digit numbers are
  prefixed with `\U`.

          uesc = (n) ->
            m = n.toString 16
            if n < 0x10000 then "\\u#{
              (new Array 4 - m.length).fill 0
              .join ""
            }#{m}" else "\\U#{
              (new Array 8 - m.length).fill 0
              .join ""
            }#{m}"

With `uesc()` defined, the function definition can begin.

          ->

The backslach, double-quote, line feed, and carriage return in the
  `nominalValue` need to be escaped.

            value = (
              if (value = @?.nominalValue)? then do value.toString
              else String(value)
            ) .replace /[\\"]/g, (char) -> "\\#{char}"
              .replace /\r/g, "\\r"
              .replace /\n/g, "\\n"

Characters not allowed in `datatype` URIs need to be escaped as well.
In order to ensure good transmission through JavaScript, this also
  means escaping any surrogate pairs.

            ( type = (
                if (value = @?.nominalValue)? then do value.toString
                else String(value)
              ) .replace /[\x00-\x20<>"{}|^`\\]/g, (char) -> uesc char
                .replace /[\uD800-\uDBFF][\uDC00-\uDFFF]/g, ([H, L]) ->
                    uesc (H - 0xD800) * 0x400 + L - 0xDC00 + 0x10000
            ) unless (language = @?.language)

Finally, these components can be composed into the N-Triple form.
There shouldn't be any characters in `language` in need of escaping.

            switch
              when language then "\"#{value}\"@#{language}"
              when type isnt "http://www.w3.org/2001/XMLSchema#string"
                "\"#{value}\"^^#{type}"
              else "\"#{value}\""

###  `literal.valueOf()`:

We provide the native JavaScript form of a literal where possible, as
  required by RDF Interfaces.

        valueOf: value: do ->

`xmlBadCharRegex` gives the inverse of the Char production from XML
  1.1.

          xmlBadCharRegex =
            /[^\x01-\uD7FF\uE000-\uFFFD\u{10000}-\u{10FFFF}]/u

The `preserve()` function simply ensures that the string is valid in
  XSD.

          preserve = (string) ->
            return unless string?
            string = do string.toString
            string unless xmlBadCharRegex.test string

The `replace()` function replaces whitespace in the given value.

          replace = (string) ->
            return unless string?
            string = (do string.toString).replace /[\t\n\r ]+/g, " "
            string unless xmlBadCharRegex.test string

The `collapse()` function collapses whitespace in the given value.

          collapse = (string) ->
            return unless string?
            string = (do string.toString)
              .replace /[\t\n\r ]+/g, " "
              .replace /^ | $/g, ""
            string unless xmlBadCharRegex.test string

The `dateFromDateTime()` function creates a JavaScript `Date()` from an
  XSD date/time.

          dateFromDateTime = (
            year = 1972
            month = 12
            day = null
            hour = 0
            minute = 0
            second = 0
            timezoneOffset = null
            endOfDay = false
          ) ->
            return if isNaN year = +year
            return if isNaN month = +month
            if !day? then day = switch month
              when 2
                if year % 4 and (not (year % 100) or year % 400)
                  28
                else 29
              when 4, 6, 9, 11 then 30
              else 31
            else return if day = +day
            return if (
              day > 30 and month in [4, 6, 9, 11] or
              day > 29 and month is 2 or
              day > 28 and month is 2 and
              (not (year % 4) or year % 100 and not (year % 400))
            )
            return if isNaN hour = +hour
            return if isNaN minute = +minute
            return if isNaN second = +second
            date = new Date year, month - 1, day, hour, minute,
              second >> 0, second * 1000 % 1000
            date.setFullYear year if date and 0 <= year < 100
            if date? and endOfDay?
              date = new Date +date + 24 * 60 * 60000
            if date? and isFinite timezoneOffset
              new Date +date + (
                timezoneOffset - do date.getTimezoneOffset
              ) * 60000
            else date

With these helper variables/functions defined, the main function
  definition  can begin.
It simply switches over our `datatype` to determine its value.

          ->
            type = @?.datatype ? ""
            literal = do ->
              if (value = @?.nominalValue)? then do value.toString
              else String value
            value = do -> switch do type.toString

The string types are the most straightforward.
It doesn't make a difference (since stringification is the fallback),
  but `http://www.w3.org/1999/02/22-rdf-syntax-ns#langString` is
  explicitly declared as a string.

              when "http://www.w3.org/2001/XMLSchema#string"
                preserve literal
              when "
                http://www.w3.org/1999/02/22-rdf-syntax-ns#langString
              " then literal
              when "http://www.w3.org/2001/XMLSchema#normalizedString"
                replace literal
              when "http://www.w3.org/2001/XMLSchema#token"
                collapse literal
              when "http://www.w3.org/2001/XMLSchema#language"
                return unless (string = collapse literal)?
                string if ///
                  ^
                  [a-zA-Z]{1,8}
                  (?:
                    -[a-zA-Z0-9]{1,8}
                  )*
                  $
                ///.test string
              when "http://www.w3.org/2001/XMLSchema#NMTOKEN"
                return unless (string = collapse literal)?
                string if ///
                  ^
                  [
                    :
                    A-Z
                    _
                    a-z
                    \xC0-\xD6
                    \xD8-\xF6
                    \xF8-\u02FF
                    \u0370-\u037D
                    \u037F-\u1FFF
                    \u200C-\u200D
                    \u2070-\u218F
                    \u2C00-\u2FEF
                    \u3001-\uD7FF
                    \uF900-\uFDCF
                    \uFDF0-\uFFFD
                    \u{10000}-\u{EFFFF}
                    \-\.0-9\xB7
                    \u0300-\u036F
                    \u203F-\u2040
                  ]+
                  $
                ///u.test string
              when "http://www.w3.org/2001/XMLSchema#Name"
                return unless (string = collapse literal)?
                string if ///
                  ^
                  [
                    :
                    A-Z
                    _
                    a-z
                    \xC0-\xD6
                    \xD8-\xF6
                    \xF8-\u02FF
                    \u0370-\u037D
                    \u037F-\u1FFF
                    \u200C-\u200D
                    \u2070-\u218F
                    \u2C00-\u2FEF
                    \u3001-\uD7FF
                    \uF900-\uFDCF
                    \uFDF0-\uFFFD
                    \u{10000}-\u{EFFFF}
                  ]
                  [
                    :
                    A-Z
                    _
                    a-z
                    \xC0-\xD6
                    \xD8-\xF6
                    \xF8-\u02FF
                    \u0370-\u037D
                    \u037F-\u1FFF
                    \u200C-\u200D
                    \u2070-\u218F
                    \u2C00-\u2FEF
                    \u3001-\uD7FF
                    \uF900-\uFDCF
                    \uFDF0-\uFFFD
                    \u{10000}-\u{EFFFF}
                    \-\.0-9\xB7
                    \u0300-\u036F
                    \u203F-\u2040
                  ]*
                  $
                ///u.test string
              when "http://www.w3.org/2001/XMLSchema#NCName"
                return unless (string = collapse literal)?
                string if ///
                  ^
                  [
                    A-Z
                    _
                    a-z
                    \xC0-\xD6
                    \xD8-\xF6
                    \xF8-\u02FF
                    \u0370-\u037D
                    \u037F-\u1FFF
                    \u200C-\u200D
                    \u2070-\u218F
                    \u2C00-\u2FEF
                    \u3001-\uD7FF
                    \uF900-\uFDCF
                    \uFDF0-\uFFFD
                    \u{10000}-\u{EFFFF}
                  ]
                  [
                    A-Z
                    _
                    a-z
                    \xC0-\xD6
                    \xD8-\xF6
                    \xF8-\u02FF
                    \u0370-\u037D
                    \u037F-\u1FFF
                    \u200C-\u200D
                    \u2070-\u218F
                    \u2C00-\u2FEF
                    \u3001-\uD7FF
                    \uF900-\uFDCF
                    \uFDF0-\uFFFD
                    \u{10000}-\u{EFFFF}
                    \-\.0-9\xB7
                    \u0300-\u036F
                    \u203F-\u2040
                  ]*
                  $
                ///u.test string

`xsd:boolean`s can be represented as `true`, `false`, `1`, or `0`.

              when "http://www.w3.org/2001/XMLSchema#boolean"
                switch collapse literal
                  when "true", "1" then true
                  when "false", "0" then false

`xsd:decimal`s are decimal numbers with an optional decimal point and
  optional sign.

              when "http://www.w3.org/2001/XMLSchema#decimal"
                return unless (string = collapse literal)?
                +string if ///
                  ^[-+]?(?:\d+(?:\.\d*)?|\.\d+)$
                ///.test string

`xsd:integer`s, are decimal numbers with no fractional part and
  optional sign.

              when "http://www.w3.org/2001/XMLSchema#integer"
                return unless (string = collapse literal)?
                +string if /^[-+]?\d+$/.test string

`xsd:positiveInteger`s are decimal numbers with no fractional part and
  optional sign, and a range of \[1, &infin;)

              when "http://www.w3.org/2001/XMLSchema#positiveInteger"
                return unless (string = collapse literal)?
                return unless /^[-+]?\d+$/.test string
                number if 1 <= (number = +string)

`xsd:nonNegativeInteger`s are decimal numbers with no fractional part
  and optional sign, and a range of \[0, &infin;)

              when "
                http://www.w3.org/2001/XMLSchema#nonNegativeInteger
              "
                return unless (string = collapse literal)?
                return unless /^[-+]?\d+$/.test string
                number if 0 <= (number = +string)

`xsd:negativeInteger`s are decimal numbers with no fractional part and
  optional sign, and a range of (&minus;&infin;, &minus;1]

              when "http://www.w3.org/2001/XMLSchema#negativeInteger"
                return unless (string = collapse literal)?
                return unless /^[-+]?\d+$/.test string
                number if (number = +string) <= -1

`xsd:nonPositiveInteger`s are decimal numbers with no fractional part
  and optional sign, and a range of (&minus;&infin;, 0]

              when "
                http://www.w3.org/2001/XMLSchema#nonPositiveInteger
              "
                return unless (string = collapse literal)?
                return unless /^[-+]?\d+$/.test string
                number if (number = +string) <= 0

`xsd:long`s are decimal numbers with no fractional part and optional
  sign, and a range of \[&minus;9223372036854775808,
  9223372036854775807].
This won't actually fit in a Javascript number.

              when "http://www.w3.org/2001/XMLSchema#long"
                return unless (string = collapse literal)?
                return unless /^[-+]?\d+$/.test string
                number if 9223372036854775808 <= (
                  number = +string
                ) <= 9223372036854775807

`xsd:unsignedLong`s are decimal numbers with no fractional part and
  optional sign, and a range of \[0, 18446744073709551615].
This won't actually fit in a Javascript number.

              when "http://www.w3.org/2001/XMLSchema#unsignedLong"
                return unless (string = collapse literal)?
                return unless /^[-+]?\d+$/.test string
                number if 0 <= (number = +string) <=
                  18446744073709551615

`xsd:int`s are decimal numbers with no fractional part and optional
  sign, and a range of \[&minus;2147483648, 2147483647]

              when "http://www.w3.org/2001/XMLSchema#int"
                return unless (string = collapse literal)?
                return unless /^[-+]?\d+$/.test string
                number if 1 << 31 <= (number = +string) <= ~(1 << 31)

`xsd:unsignedInt`s are decimal numbers with no fractional part and
  optional sign, and a range of \[0, 4294967295]

              when "http://www.w3.org/2001/XMLSchema#unsignedInt"
                return unless (string = collapse literal)?
                return unless /^[-+]?\d+$/.test string
                number if 0 <= (number = +string) <= 4294967295

`xsd:short`s are decimal numbers with no fractional part and optional
  sign, and a range of \[&minus;32768, 32767]

              when "http://www.w3.org/2001/XMLSchema#short"
                return unless (string = collapse literal)?
                return unless /^[-+]?\d+$/.test string
                number if -32768 <= (number = +string) <= 32767

`xsd:unsignedShort`s are decimal numbers with no fractional part and
  optional sign, and a range of \[0, 65535]

              when "http://www.w3.org/2001/XMLSchema#unsignedShort"
                return unless (string = collapse literal)?
                return unless /^[-+]?\d+$/.test string
                number if 0 <= (number = +string) <= 65535

`xsd:byte`s are decimal numbers with no fractional part and optional
  sign, and a range of \[&minus;128, 127]

              when "http://www.w3.org/2001/XMLSchema#byte"
                return unless (string = collapse literal)?
                return unless /^[-+]?\d+$/.test string
                number if -128 <= (number = +string) <= 127

`xsd:unsignedByte`s are decimal numbers with no fractional part and
  optional sign, and a range of \[0, 255]

              when "http://www.w3.org/2001/XMLSchema#unsignedByte"
                return unless (string = collapse literal)?
                return unless /^[-+]?\d+$/.test string
                number if 0 <= (number = +string) <= 255

`xsd:float`s and `xsd:double`s are just typical JavaScript `Number`s,
  although we do have to handle `NaN` and our infinities specially.
Technically speaking, `xsd:float`s do not have as much precision as
  `xsd:double`s, but ｍｅｒｍａｉｄ doesn't bother with the
  distinction.

              when "http://www.w3.org/2001/XMLSchema#float"
              , "http://www.w3.org/2001/XMLSchema#double"
                switch string = collapse literal
                  when "NaN" then NaN
                  when "INF" then +Infinity
                  when "-INF" then -Infinity
                  else +string if string? and ///
                    (\+|-)?
                    ([0-9]+(\.[0-9]*)?|\.[0-9]+)
                    ([Ee](\+|-)?[0-9]+)?
                  ///.test string

`xsd:dateTime`s are `Date`s, with their conventional meaning.

              when "http://www.w3.org/2001/XMLSchema#dateTime"
                return unless (string = collapse literal)?
                match = string.match ///
                  ^
                  (-?(?:[1-9][0-9]{3,}|0[0-9]{3}))
                  -
                  (0[1-9]|1[0-2])
                  -
                  (0[1-9]|[12][0-9]|3[01])
                  T
                  (
                    ([01][0-9]|2[0-3])
                    :
                    ([0-5][0-9])
                    :
                    (
                      (?:[0-5][0-9])
                      (?:
                        \.
                        (?:[0-9]+)
                      )?
                    )
                  |
                    (24:00:00(?:\.0+)?)
                  )
                  (?:
                    Z
                  |
                    (\+|-)
                    (?:
                      (0[0-9]|1[0-3])
                      :
                      ([0-5][0-9])
                      |
                      (14:00)
                    )
                  )?
                  $
                ///
                return unless match?
                [ match
                  year
                  month
                  day
                  hour = 0
                  minute = 0
                  second = 0
                  twenty_four_hundred
                  time_zone_sign = "+"
                  time_zone_hour
                  time_zone_minute
                  time_zone_fourteen_hundred
                ] = match
                if time_zone_hour? and time_zone_minute?
                  timezoneOffset = time_zone_hour * 60 +
                    +time_zone_minute
                else if time_zone_fourteen_hundred?
                  timezoneOffset = 14 * 60
                timezoneOffset = -timezoneOffset if time_zone_sign is
                  "-"
                dateFromDateTime year, month, day, hour, minute,
                  second, timezoneOffset, twenty_four_hundred?

`xsd:dateTimeStamp`s are `Date`s which are required to have a timezone.

              when "http://www.w3.org/2001/XMLSchema#dateTimeStamp"
                return unless (string = collapse literal)?
                match = string.match ///
                  ^
                  (-?(?:[1-9][0-9]{3,}|0[0-9]{3}))
                  -
                  (0[1-9]|1[0-2])
                  -
                  (0[1-9]|[12][0-9]|3[01])
                  T
                  (
                    ([01][0-9]|2[0-3])
                    :
                    ([0-5][0-9])
                    :
                    (
                      (?:[0-5][0-9])
                      (?:
                        \.
                        (?:[0-9]+)
                      )?
                    )
                  |
                    (24:00:00(?:\.0+)?)
                  )
                  (?:
                    Z
                  |
                    (\+|-)
                    (?:
                      (0[0-9]|1[0-3])
                      :
                      ([0-5][0-9])
                      |
                      (14:00)
                    )
                  )
                  $
                ///
                return unless match?
                [ match
                  year
                  month
                  day
                  hour = 0
                  minute = 0
                  second = 0
                  twenty_four_hundred
                  time_zone_sign = "+"
                  time_zone_hour
                  time_zone_minute
                  time_zone_fourteen_hundred
                ] = match
                if time_zone_hour? and time_zone_minute?
                  timezoneOffset = time_zone_hour * 60 +
                    +time_zone_minute
                else if time_zone_fourteen_hundred?
                  timezoneOffset = 14 * 60
                timezoneOffset = -timezoneOffset if time_zone_sign is
                  "-"
                dateFromDateTime year, month, day, hour, minute,
                  second, timezoneOffset, twenty_four_hundred?

`xsd:time`s are `Date`s, with the base date being December 31, 1972.

              when "http://www.w3.org/2001/XMLSchema#time"
                return unless (string = collapse literal)?
                match = string.match ///
                  ^
                  (
                    ([01][0-9]|2[0-3])
                    :
                    ([0-5][0-9])
                    :
                    (
                      (?:[0-5][0-9])
                      (?:
                        \.
                        (?:[0-9]+)
                      )?
                    )
                  |
                    (24:00:00(?:\.0+)?)
                  )
                  (?:
                    Z
                  |
                    (\+|-)
                    (?:
                      (0[0-9]|1[0-3])
                      :
                      ([0-5][0-9])
                      |
                      (14:00)
                    )
                  )?
                  $
                ///
                return unless match?
                [ match
                  hour = 0
                  minute = 0
                  second = 0
                  twenty_four_hundred
                  time_zone_sign = "+"
                  time_zone_hour
                  time_zone_minute
                  time_zone_fourteen_hundred
                ] = match
                if time_zone_hour? and time_zone_minute?
                  timezoneOffset = time_zone_hour * 60 +
                    +time_zone_minute
                else if time_zone_fourteen_hundred?
                  timezoneOffset = 14 * 60
                timezoneOffset = -timezoneOffset if time_zone_sign is
                  "-"
                dateFromDateTime 1972, 12, 31, hour, minute, second,
                  timezoneOffset, twenty_four_hundred?

`xsd:date`s are `Date`s, with the time being 00:00:00.

              when "http://www.w3.org/2001/XMLSchema#date"
                return unless (string = collapse literal)?
                match = string.match ///
                  ^
                  (-?(?:[1-9][0-9]{3,}|0[0-9]{3}))
                  -
                  (0[1-9]|1[0-2])
                  -
                  (0[1-9]|[12][0-9]|3[01])
                  (?:
                    Z
                  |
                    (\+|-)
                    (?:
                      (0[0-9]|1[0-3])
                      :
                      ([0-5][0-9])
                      |
                      (14:00)
                    )
                  )?
                  $
                ///
                return unless match?
                [ match
                  year
                  month
                  day
                  time_zone_sign = "+"
                  time_zone_hour
                  time_zone_minute
                  time_zone_fourteen_hundred
                ] = match
                if time_zone_hour? and time_zone_minute?
                  timezoneOffset = time_zone_hour * 60 +
                    +time_zone_minute
                else if time_zone_fourteen_hundred?
                  timezoneOffset = 14 * 60
                timezoneOffset = -timezoneOffset if time_zone_sign is
                  "-"
                dateFromDateTime year, month, day, 0, 0, 0,
                  timezoneOffset

`xsd:gYearMonth`s are `Date`s, with the day being the last of the
  month and the time being 00:00:00.

              when "http://www.w3.org/2001/XMLSchema#gYearMonth"
                return unless (string = collapse literal)?
                match = string.match ///
                  ^
                  (-?(?:[1-9][0-9]{3,}|0[0-9]{3}))
                  -
                  (0[1-9]|1[0-2])
                  (?:
                    Z
                  |
                    (\+|-)
                    (?:
                      (0[0-9]|1[0-3])
                      :
                      ([0-5][0-9])
                      |
                      (14:00)
                    )
                  )?
                  $
                ///
                return unless match?
                [ match
                  year
                  month
                  time_zone_sign = "+"
                  time_zone_hour
                  time_zone_minute
                  time_zone_fourteen_hundred
                ] = match
                if time_zone_hour? and time_zone_minute?
                  timezoneOffset = time_zone_hour * 60 +
                    +time_zone_minute
                else if time_zone_fourteen_hundred?
                  timezoneOffset = 14 * 60
                timezoneOffset = -timezoneOffset if time_zone_sign is
                  "-"
                dateFromDateTime year, month, null, 0, 0, 0,
                  timezoneOffset

`xsd:gYear`s are `Date`s, with the month being December, the
  day being the 31st, and the time being 00:00:00.

              when "http://www.w3.org/2001/XMLSchema#gYear"
                return unless (string = collapse literal)?
                match = string.match ///
                  ^
                  (-?(?:[1-9][0-9]{3,}|0[0-9]{3}))
                  (?:
                    Z
                  |
                    (\+|-)
                    (?:
                      (0[0-9]|1[0-3])
                      :
                      ([0-5][0-9])
                      |
                      (14:00)
                    )
                  )?
                  $
                ///
                return unless match?
                [ match
                  year
                  time_zone_sign = "+"
                  time_zone_hour
                  time_zone_minute
                  time_zone_fourteen_hundred
                ] = match
                if time_zone_hour? and time_zone_minute?
                  timezoneOffset = time_zone_hour * 60 +
                    +time_zone_minute
                else if time_zone_fourteen_hundred?
                  timezoneOffset = 14 * 60
                timezoneOffset = -timezoneOffset if time_zone_sign is
                  "-"
                dateFromDateTime year, 12, 31, 0, 0, 0, timezoneOffset

`xsd:gMonthDay`s are `Date`s, with the year being 1972 and the time
  being 00:00:00.
1972 is a leap&#hyphen;year, so February 29th is a valid month and day
  for this year.

              when "http://www.w3.org/2001/XMLSchema#gMonthDay"
                return unless (string = collapse literal)?
                match = string.match ///
                  ^
                  --
                  (0[1-9]|1[0-2])
                  -
                  (0[1-9]|[12][0-9]|3[01])
                  (?:
                    Z
                  |
                    (\+|-)
                    (?:
                      (0[0-9]|1[0-3])
                      :
                      ([0-5][0-9])
                      |
                      (14:00)
                    )
                  )?
                  $
                ///
                return unless match?
                [ match
                  month
                  day
                  time_zone_sign = "+"
                  time_zone_hour
                  time_zone_minute
                  time_zone_fourteen_hundred
                ] = match
                if time_zone_hour? and time_zone_minute?
                  timezoneOffset = time_zone_hour * 60 +
                    +time_zone_minute
                else if time_zone_fourteen_hundred?
                  timezoneOffset = 14 * 60
                timezoneOffset = -timezoneOffset if time_zone_sign is
                  "-"
                dateFromDateTime 1972, month, day, 0, 0, 0,
                  timezoneOffset

`xsd:gDay`s are `Date`s, with the year being 1972, the month being
  December, and the time being 00:00:00.
Note that all 31 days are valid in December.

              when "http://www.w3.org/2001/XMLSchema#gDay"
                return unless (string = collapse literal)?
                match = string.match ///
                  ^
                  ---
                  (0[1-9]|[12][0-9]|3[01])
                  (?:
                    Z
                  |
                    (\+|-)
                    (?:
                      (0[0-9]|1[0-3])
                      :
                      ([0-5][0-9])
                      |
                      (14:00)
                    )
                  )?
                  $
                ///
                return unless match?
                [ match
                  day
                  time_zone_sign = "+"
                  time_zone_hour
                  time_zone_minute
                  time_zone_fourteen_hundred
                ] = match
                if time_zone_hour? and time_zone_minute?
                  timezoneOffset = time_zone_hour * 60 +
                    +time_zone_minute
                else if time_zone_fourteen_hundred?
                  timezoneOffset = 14 * 60
                timezoneOffset = -timezoneOffset if time_zone_sign is
                  "-"
                dateFromDateTime 1972, 12, day, 0, 0, 0, timezoneOffset

`xsd:gMonth`s are `Date`s, with the year being 1972, the day being the
  last of the month, and the time being 00:00:00.

              when "http://www.w3.org/2001/XMLSchema#gMonth"
                return unless (string = collapse literal)?
                match = string.match ///
                  ^
                  --
                  (0[1-9]|1[0-2])
                  (?:
                    Z
                  |
                    (\+|-)
                    (?:
                      (0[0-9]|1[0-3])
                      :
                      ([0-5][0-9])
                      |
                      (14:00)
                    )
                  )?
                  $
                ///
                return unless match?
                [ match
                  month
                  time_zone_sign = "+"
                  time_zone_hour
                  time_zone_minute
                  time_zone_fourteen_hundred
                ] = match
                if time_zone_hour? and time_zone_minute?
                  timezoneOffset = time_zone_hour * 60 +
                    +time_zone_minute
                else if time_zone_fourteen_hundred?
                  timezoneOffset = 14 * 60
                timezoneOffset = -timezoneOffset if time_zone_sign is
                  "-"
                dateFromDateTime 1972, month, null, 0, 0, 0,
                  timezoneOffset

`xsd:hexBinary`s are `ArrayBuffer`s where supported.

              when "http://www.w3.org/2001/XMLSchema#hexBinary"
                return unless (string = collapse literal)?
                return unless /^(?:[\dA-Fa-f]{2})*$/.test string
                return hexes unless typeof Uint8Array is "function"
                array = new Uint8Array string.length / 2
                index = 0
                array[index] = (parseInt string[index++], 0x10) *
                  0x10 + parseInt string[index++], 0x10 while index < string.length
                array.buffer

`xsd:base64Binary`s are `ArrayBuffer`s where supported.

              when "http://www.w3.org/2001/XMLSchema#base64Binary"
                return unless (string = collapse literal)?
                return unless ///
                    ^
                    (?:
                      (?:(?:[A-Za-z0-9+/] ?){4})*
                      (?:
                        (?:[A-Za-z0-9+/] ?){3}[A-Za-z0-9+/]
                      |
                        (?:[A-Za-z0-9+/] ?){2}[AEIMQUYcgkosw048] ?=
                      |
                        [A-Za-z0-9+/] ?[AQgw] ?= ?=
                      )
                    )?
                    $
                  ///.test string
                return string unless typeof Uint8Array is "function"
                string = string.replace /\x20/g, ""
                base64Map =
                  "+": 62
                  "/": 63
                for char, pos in "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                  base64_map[char] = pos
                  base64_map[do char.toLowerCase] = pos + 26
                size = string
                  .replace /=*$/, ""
                  .length * 3 / 4 >>> 0
                array = new Uint8Array size
                index = 0
                while index < size
                  next24Bits = 0
                  ( next24Bits += base64_map[string[index + offset]] *
                      64 ** (3 - offset)
                  ) for offset in [0..3]
                  array[index++] = next24Bits / 0x10000 >>> 0
                  array[index++] = next24Bits / 0x100 % 0x100 >>> 0
                  array[index++] = next24Bits % 0x100
                array.buffer

`xsd:anyURI`s are `URL`s where available.

              when "http://www.w3.org/2001/XMLSchema#anyURI"
                break unless (string = collapse literal)?
                try
                  uri = new RFC3987 string
                  do uri.valueOf
                catch then break

If no native value was returned, the string representation is given as
  the value instead, as mandated by RDF Interfaces.

            return value ? literal

___

<details>
  <summary>License notice</summary>
  <p>This file is a part of ｍｅｒｍａｉｄ.</p>
  <p>ｍｅｒｍａｉｄ is free software: you can redistribute it and/or
    modify it under the terms of the GNU General Public License as
    published by the Free Software Foundation, either version 3 of the
    License, or (at your option) any later version. Similarly, you can
    redistribute and/or modify the documentation sections of this
    document under the terms of the Creative Commons
    Attribution-ShareAlike 4.0 International License.</p>
  <p>ｍｅｒｍａｉｄ is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
    General Public License for more details.</p>
  <p>You should have received copies of the GNU General Public License
    and the Creative Commons Attribution-ShareAlike 4.0 International
    License along with this source. If not, see
    https://www.gnu.org/licenses/ and
    https://creativecommons.org/licenses/by-sa/4.0/.</p>
</details>
