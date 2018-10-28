<div align="right">
  <b><cite>ｍｅｒｍａｉｄ</cite></b><br />
  Source and Documentation<br />
  <code>Sources/IETF/BCP47.litcoffee</code>
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

#  BCP47 Tags  #

>   Reference specifications:
>   + <https://tools.ietf.org/html/bcp47>

BCP47 specifies the syntax and semantics of language tags.
For ｍｅｒｍａｉｄ, we only care whether a language tag is
  _well-formed_ (syntactically correct) and not _valid_.

    BCP47 = BCP47ℙ = undefined
    Object.defineProperty ｍｅｒｍａｉｄ, "BCP47",
      configurable: yes
      enumerable: yes
      value: do ->  #  Returns `BCP47`

The following is just a regexification of the ABNF in BCP47.

        regex = ///
          ^
          (?:
            (  #  langtag
              (  #  language
                [A-Za-z]{2,3}
                (  # extlang
                  -
                  [A-Za-z]{3}
                  (?:-[A-Za-z]{3}){0,2}
                )?
                | [A-Za-z]{4,8}
              )
              (?:
                -
                (  #  script
                  [A-Za-z]{4}
                )
              )?
              (?:
                -
                (  #  region
                  [A-Za-z]{2}
                  | \d{3}
                )
              )?
              (?:
                -
                (  #  variant
                  [0-9A-Za-z]{5,8}
                  | \d[0-9A-Za-z]{3}
                  (?:
                    -
                    [0-9A-Za-z]{5,8}
                    | \d[0-9A-Za-z]{3}
                  )*
                )
              )?
              (?:
                -
                (  #  extension
                  [0-9A-WY-Za-wy-z]
                  (?:
                    -
                    [0-9A-Za-z]{2,8}
                  )+
                  (?:
                    -
                    [0-9A-WY-Za-wy-z]
                    (?:
                      -
                      [0-9A-Za-z]{2,8}
                    )+
                  )*
                )
              )?
              (?:
                -
                (  #  privateuse
                  x
                  (?:
                    -
                    [0-9A-Za-z]{2,8}
                  )+
                )
              )?
            ) | (  #  privateuseonly
              x
              (?:
                -
                [0-9A-Za-z]{2,8}
              )+
            ) | (  #  grandfathered
              en-GB-oed
              | i-(?:
                ami
                | bnn
                | default
                | enochian
                | hak
                | klingon
                | lux
                | mingo
                | navajo
                | pwn
                | tao
                | tay
                | tsu
              ) | sgn-(?:
                BE-FR |
                BE-NL |
                CH-DE
              )
            )
          )?
          $
        ///

##  The Constructor  ##

The `BCP47()` function returns an object whose properties give the
  various components of the language tag, as arrays.

        BCP47 = (tag) ->
          match = (if tag? then do tag.toString else "").match regex
          throw new TypeError "Language tag not well-formed under
            BCP47" unless match?
          [ match
            langtag
            language
            extlang
            script
            region
            variant
            extension
            privateuse
            privateuseonly
            grandfathered
          ] = match

It is not required that `RFC3987()` be called as a constructor.

          Object.defineProperties (@ ? Object.create BCP47ℙ),

##  Instance Properties  ##

###  `bcp47.langtag`:

`langtag` can be used to access the entire language tag, including
  grandfathered and private-use tags.

            langtag:
              enumerable: yes
              value: langtag ? privateuseonly ? grandfathered ? ""

###  `bcp47.language`:

The `language` component of the tag, or the empty string.

            language:
              enumerable: yes
              value: language ? ""

###  `bcp47.extlang`:

The `extlang` component of the tag, or the empty string.

            extlang:
              enumerable: yes
              value: extlang ? ""

###  `bcp47.script`:

The `script` component of the tag, or the empty string.

            script:
              enumerable: yes
              value: script ? ""

###  `bcp47.region`:

The `region` component of the tag, or the empty string.

            region:
              enumerable: yes
              value: region ? ""

###  `bcp47.variant`:

The `variant` component of the tag, or the empty string.

            variant:
              enumerable: yes
              value: variant ? ""

###  `bcp47.extension`:

The `extension` component of the tag, or the empty string.

            extension:
              enumerable: yes
              value: extension ? ""

###  `bcp47.privateuse`:

The `privateuse` component of the tag, or the empty string.

            privateuse:
              enumerable: yes
              value: privateuse ? privateuseonly ? ""

##  The Prototype  ##

        Object.defineProperty BCP47, "prototype",
          writable: no
          value: Object.defineProperties BCP47ℙ = {},

##  Instance Methods  ##

###  `bcp47.constructor()`:

`constructor()` is just the `BCP47()` constructor.

            constructor: value: BCP47

###  `bcp47.toString()`:

The `toString()` method simply returns the `langtag`.

            toString: value: ->
              if @langtag? then do @langtag.toString
              else ""

###  `bcp47.valueOf()`:

The `toString()` method simply returns the `langtag`.

            valueOf: value: -> @langtag

##  Constructor Properties  ##

###  `BCP47.regex`:

The BCP47 `regex` is available as a property on the `BCP47()`
  constructor itself.

        Object.defineProperties BCP47,
          regex:
            configurable: yes
            enumerable: yes
            value: regex

##  Constructor Methods  ##

###  `RFC3987.test(tag)`:

The `test()` function checks if a given string is a well-formed tag,
  returning `true` or `false`.

          test:
            configurable: yes
            enumerable: yes
            value: (tag) -> regex.test tag

###  `RFC3987.testǃ(tag)`:

The `testǃ()` function does the same, but returns `undefined`, and
  throws an error if it is not.

          testǃ:
            configurable: yes
            enumerable: yes
            value: (tag) -> throw new TypeError "
              Language tag is not well-formed according to BCP47.
            " unless regex.test tag

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
