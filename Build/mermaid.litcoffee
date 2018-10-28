<div align="right">
  <b><cite>ｍｅｒｍａｉｄ</cite></b><br />
  Source and Documentation<br />
  <code>README.litcoffee</code>
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

#  ｍｅｒｍａｉｄ  #

**ｍｅｒｍａｉｄ** is an RDF graph library written in Literate
  CoffeeScript and licensed under the GNU GPLv3.
This file will serve as your introduction to the source code, and
  provide information on the project in general.

ｍｅｒｍａｉｄ targets browsers—more or less.
It will interpret `self` or `window` as the "global object" if it
  exists; otherwise it will assign to `exports` for CommonJS requires.
Please try to ensure that one of these objects exists in your
  environment _before_ running this code—otherwise, nothing will
  happen!

    global = self ? window ? exports
    throw new ReferenceError "Unknown global object." unless global

##  Required Constructors  ##

Many ｍｅｒｍａｉｄ functions can only be called as constructors.
The `constructǃ` function makes checking for this easy.

    constructǃ = (context, constructor, type) ->
      throw new TypeError "
        #{type} must be called as a constructor.
      " unless context?
      throw new TypeError "
        This is not a #{type}.
      " unless context instanceof constructor

##  Uncallable Constructors  ##

To save space, the generator function `Ø` is defined for generating
  uncallable constructors whenever they are needed in the code.
`Ø` takes as its arguments an `identifier`, which will be inferred as
  the function name (not actually in ES 5.1, but potentially in later
  versions), and `ℙ`, which is the (real) prototype for the fake
  constructor.

    Ø = (identifier = "anonymous", ℙ = Object::) ->
      obj = [identifier]: -> throw new TypeError "Illegal constructor."
      Object.defineProperty obj[identifier], "prototype",
        configurable: no
        value: ℙ
        writable: no

##  Using ｍｅｒｍａｉｄ  ##

All ｍｅｒｍａｉｄ constants, objects, and constructors are made
available through the `ｍｅｒｍａｉｄ` object.
The `ｍｅｒｍａｉｄ` object is technically an instance of
`Ｍｅｒｍａｉｄ`—but this constructor doesn't do anything and can't
actually be called.

    Object.defineProperty (Ｍｅｒｍａｉｄ = ->)::, "constructor",
      configurable: no
      value: Ø "Ｍｅｒｍａｉｄ", Ｍｅｒｍａｉｄ::
      writable: no
    ｍｅｒｍａｉｄ = new Ｍｅｒｍａｉｄ

ｍｅｒｍａｉｄ targets vanilla ES 5.1, so it doesn't use modules or
  similar.
It simply attaches itself to the global object at `"ｍｅｒｍａｉｄ"`.
For the adventurous, you can also access the ｍｅｒｍａｉｄ object from
  the emoji sequence `"🧜‍♀️🌊"`.
Nongendered merpeople are allowed too!

    SIGIL = do ->
      MALE = "\u2642"
      MERPERSON = "\u{1F9DC}"
      FEMALE = "\u2640"
      VS16 = "\uFE0F"
      WAVE = "\u{1F30A}"
      ZWJ = "\u200D"
      Object.defineProperties global,
        ｍｅｒｍａｉｄ:
          configurable: yes
          value: ｍｅｒｍａｉｄ
        "#{MERPERSON}#{WAVE}":
          configurable: yes
          value: ｍｅｒｍａｉｄ
        "#{MERPERSON}#{ZWJ}#{FEMALE}#{VS16}#{WAVE}":
          configurable: yes
          value: ｍｅｒｍａｉｄ
        "#{MERPERSON}#{ZWJ}#{MALE}#{VS16}#{WAVE}":
          configurable: no
          value: null  #  No boys allowed!!
      return "#{MERPERSON}#{WAVE}"

##  Identity Information  ##

The global `ｍｅｒｍａｉｄ` object identifies itself using a number of
  properties, so that you can easily tell which version you are using
  (and so that you can build tools which support multiple versions!)

    Object.defineProperties ｍｅｒｍａｉｄ,

The `ℹ` property provides an identifying URI for the API author of this
  version of ｍｅｒｍａｉｄ.
If you fork ｍｅｒｍａｉｄ and change its API, you should also change
  this value.

      ℹ: value: "https://go.KIBI.family/mermaid/"

The `Nº` property provides the version number of this version of
  ｍｅｒｍａｉｄ, as an object with three parts: `major`, `minor`, and
  `patch`.
It is up to the API author (identified above) to determine how these
  parts should be interpreted.
It is recommended that the `toString()` and `valueOf()` methods be
  implemented as well.

      Nº: value: Object.freeze
        major: 0
        minor: 1
        patch: 0
        toString: -> "#{@major}.#{@minor}.#{@patch}"
        valueOf: -> @major * 100 + @minor + @patch / 100

##  How to Read This Source  ##

ｍｅｒｍａｉｄ is written in Literate CoffeeScript; this file is
  actually a part of the ｍｅｒｍａｉｄ source!
If you are new to Literate CoffeeScript, you might be surprised to find
  that the code blocks above are the actual source for those parts of
  the program.
The rest of the source files are structured in a similar way, mixing
  source code with documentation.

For those experienced in CoffeeScript, you might expect each file to be
  wrapped in a closure, with its own local variables.
However, the ｍｅｒｍａｉｄ build procedures stitch the source files
  together _prior_ to compilation.
That means that local variables declared in one file will be made
  available in later ones, but not to the global context as a whole.
See [Roost](https://github.com/marrus-sh/Roost) if you're curious about
  this process.

The style of CoffeeScript used in this source differs pretty
  significantly from what you might encounter elsewhere.
Stick with it, and you'll get the hang of it, and you can always
  [compile to JavaScript](https://coffeescript.org/#try) those parts
  that you do not understand.

##  Don't Be Confused!  ##

As you have probably already noticed, this source uses Unicode
  characters in some variable names.
The global variable, `ｍｅｒｍａｉｄ`, is written using fullwidth
  characters, and this is _not_ the same name `mermaid`, written using
  proportional (ASCII) ones.

The letter `U+01C0 ǀ LATIN LETTER DENTAL CLICK` is used to "namespace"
  names.
For example, all of the types defined by the XML Schema Definition
  Language specification have JavaScript constructors whose names start
  with `XSDǀ`.
This is _not_ the same character as `U+007C | VERTICAL LINE`, which
  will always appear in this source surrounded by spaces.

The letter `U+01C3 ǃ LATIN LETTER RETROFLEX CLICK` is used in function
  names to denote a function that either throws an error or returns
  `undefined`.
Frequently, this function is named `testǃ`.
This is _not_ the same character as `U+0021 ! EXCLAMATION MARK`, which
  will never appear in this source directly following a variable name.

The letter `U+02D0 ℙ DOUBLE-STRUCK CAPITAL P` is used in local
  variable names for prototypes; `Exampleℙ` provides the local name for
  `Example.prototype` (in CoffeeScript, `Example::`).

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

_______________________________________________________________________

<div align="right">
  <b><cite>ｍｅｒｍａｉｄ</cite></b><br />
  Source and Documentation<br />
  <code>Sources/IETF/RFC3987.litcoffee</code>
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

#  RFC3987 IRIs  #

>   Reference specifications:
>   + <https://tools.ietf.org/html/rfc3987>

RFC3987 specifies the syntax and semantics of Internationalized
  Resource Identifiers (IRIs).
For ｍｅｒｍａｉｄ, we only care whether an IRI is _well&hyphen;formed_
  (syntactically correct) and not _valid_.

    RFC3987 = RFC3987ℙ = undefined
    Object.defineProperty ｍｅｒｍａｉｄ, "RFC3987",
      configurable: yes
      enumerable: yes
      value: do ->  #  Returns `RFC3987`

The following is just a regexification of the ABNF in RFC3987.

        regex = ///
          ^
          (  #  absoluteIRI
            (  #  scheme
            )
            :
            (  #  ihierPart
              //
              (  #  iauthority
                (?:
                  (  #  iuserinfo
                    (?:
                      [
                        0-9A-Za-z\-\._~
                        \u00A0-\uD7FF
                        \uF900-\uFDCF
                        \uFDF0-\uFFEF
                        \u{10000}-\u{1FFFD}
                        \u{20000}-\u{2FFFD}
                        \u{30000}-\u{3FFFD}
                        \u{40000}-\u{4FFFD}
                        \u{50000}-\u{5FFFD}
                        \u{60000}-\u{6FFFD}
                        \u{70000}-\u{7FFFD}
                        \u{80000}-\u{8FFFD}
                        \u{90000}-\u{9FFFD}
                        \u{A0000}-\u{AFFFD}
                        \u{B0000}-\u{BFFFD}
                        \u{C0000}-\u{CFFFD}
                        \u{D0000}-\u{DFFFD}
                        \u{E0000}-\u{EFFFD}
                        !\$&'()*+,;=:
                      ] | %[0-9A-Fa-f]{2}
                    )*
                  )
                  @
                )?
                (  #  ihost
                  (  #  IPLiteral
                    \[
                    (  #  IPv6address
                      (?:
                        [0-9A-Fa-f]{1,4}
                        :
                      ){6}
                      (?:
                        [0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}
                      |
                        (?:
                          (?:
                            \d | [1-9]\d | 1\d{2} | 2[0-4]\d
                            | 25[0-5]
                          )
                          \.
                        ){3}
                        (?:
                          \d | [1-9]\d | 1\d{2} | 2[0-4]\d
                          | 25[0-5]
                        )
                      )
                    |
                      ::
                      (?:
                        [0-9A-Fa-f]{1,4}
                        :
                      ){5}
                      (?:
                        [0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}
                      |
                        (?:
                          (?:
                            \d | [1-9]\d | 1\d{2} | 2[0-4]\d
                            | 25[0-5]
                          )
                          \.
                        ){3}
                        (?:
                          \d | [1-9]\d | 1\d{2} | 2[0-4]\d
                          | 25[0-5]
                        )
                      )
                    |
                      (?:
                        [0-9A-Fa-f]{1,4}
                      )?
                      ::
                      (?:
                        [0-9A-Fa-f]{1,4}
                        :
                      ){4}
                      (?:
                        [0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}
                      |
                        (?:
                          (?:
                            \d | [1-9]\d | 1\d{2} | 2[0-4]\d
                            | 25[0-5]
                          )
                          \.
                        ){3}
                        (?:
                          \d | [1-9]\d | 1\d{2} | 2[0-4]\d
                          | 25[0-5]
                        )
                      )
                    |
                      (?:
                        (?:
                          [0-9A-Fa-f]{1,4}
                          :
                        )?
                        [0-9A-Fa-f]{1,4}
                      )?
                      ::
                      (?:
                        [0-9A-Fa-f]{1,4}
                        :
                      ){3}
                      (?:
                        [0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}
                      |
                        (?:
                          (?:
                            \d | [1-9]\d | 1\d{2} | 2[0-4]\d
                            | 25[0-5]
                          )
                          \.
                        ){3}
                        (?:
                          \d | [1-9]\d | 1\d{2} | 2[0-4]\d
                          | 25[0-5]
                        )
                      )
                    |
                      (?:
                        (?:
                          [0-9A-Fa-f]{1,4}
                          :
                        ){0,2}
                        [0-9A-Fa-f]{1,4}
                      )?
                      ::
                      (?:
                        [0-9A-Fa-f]{1,4}
                        :
                      ){2}
                      (?:
                        [0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}
                      |
                        (?:
                          (?:
                            \d | [1-9]\d | 1\d{2} | 2[0-4]\d
                            | 25[0-5]
                          )
                          \.
                        ){3}
                        (?:
                          \d | [1-9]\d | 1\d{2} | 2[0-4]\d
                          | 25[0-5]
                        )
                      )
                    |
                      (?:
                        (?:
                          [0-9A-Fa-f]{1,4}
                          :
                        ){0,3}
                        [0-9A-Fa-f]{1,4}
                      )?
                      ::
                      (?:
                        [0-9A-Fa-f]{1,4}
                        :
                      )
                      (?:
                        [0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}
                      |
                        (?:
                          (?:
                            \d | [1-9]\d | 1\d{2} | 2[0-4]\d
                            | 25[0-5]
                          )
                          \.
                        ){3}
                        (?:
                          \d | [1-9]\d | 1\d{2} | 2[0-4]\d
                          | 25[0-5]
                        )
                      )
                    |
                      (?:
                        (?:
                          [0-9A-Fa-f]{1,4}
                          :
                        ){0,4}
                        [0-9A-Fa-f]{1,4}
                      )?
                      ::
                      (?:
                        [0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}
                      |
                        (?:
                          (?:
                            \d | [1-9]\d | 1\d{2} | 2[0-4]\d
                            | 25[0-5]
                          )
                          \.
                        ){3}
                        (?:
                          \d | [1-9]\d | 1\d{2} | 2[0-4]\d
                          | 25[0-5]
                        )
                      )
                    |
                      (?:
                        (?:
                          [0-9A-Fa-f]{1,4}
                          :
                        ){0,5}
                        [0-9A-Fa-f]{1,4}
                      )?
                      ::
                      [0-9A-Fa-f]{1,4}
                      (?:
                        (?:
                          [0-9A-Fa-f]{1,4}
                          :
                        ){0,6}
                        [0-9A-Fa-f]{1,4}
                      )?
                      ::
                    ) | (  #  IPvFuture
                      v
                      [0-9A-Fa-f]+
                      \.
                      [0-9A-Za-z\-\._~!\$&'()*+,;=:]+
                    )
                    \]
                  ) | (  #  IPv4address
                    (?:
                      (?:
                        \d | [1-9]\d | 1\d{2} | 2[0-4]\d
                        | 25[0-5]
                      )
                      \.
                    ){3}
                    (?:
                      \d | [1-9]\d | 1\d{2} | 2[0-4]\d
                      | 25[0-5]
                    )
                  ) | (  #  iregName
                    (?:
                      [
                        0-9A-Za-z\-\._~
                        \u00A0-\uD7FF
                        \uF900-\uFDCF
                        \uFDF0-\uFFEF
                        \u{10000}-\u{1FFFD}
                        \u{20000}-\u{2FFFD}
                        \u{30000}-\u{3FFFD}
                        \u{40000}-\u{4FFFD}
                        \u{50000}-\u{5FFFD}
                        \u{60000}-\u{6FFFD}
                        \u{70000}-\u{7FFFD}
                        \u{80000}-\u{8FFFD}
                        \u{90000}-\u{9FFFD}
                        \u{A0000}-\u{AFFFD}
                        \u{B0000}-\u{BFFFD}
                        \u{C0000}-\u{CFFFD}
                        \u{D0000}-\u{DFFFD}
                        \u{E0000}-\u{EFFFD}
                        !\$&'()*+,;=
                      ] | %[0-9A-Fa-f]{2}
                    )*
                  )
                )
                (?:
                  :
                  (  #  port
                    \d*
                  )
                )?
                (  #  ipathAbempty
                  (?:
                    /
                    (?:
                      [
                        0-9A-Za-z\-\._~
                        \u00A0-\uD7FF
                        \uF900-\uFDCF
                        \uFDF0-\uFFEF
                        \u{10000}-\u{1FFFD}
                        \u{20000}-\u{2FFFD}
                        \u{30000}-\u{3FFFD}
                        \u{40000}-\u{4FFFD}
                        \u{50000}-\u{5FFFD}
                        \u{60000}-\u{6FFFD}
                        \u{70000}-\u{7FFFD}
                        \u{80000}-\u{8FFFD}
                        \u{90000}-\u{9FFFD}
                        \u{A0000}-\u{AFFFD}
                        \u{B0000}-\u{BFFFD}
                        \u{C0000}-\u{CFFFD}
                        \u{D0000}-\u{DFFFD}
                        \u{E0000}-\u{EFFFD}
                        !\$&'()*+,;=:@
                      ] | %[0-9A-Fa-f]{2}
                    )*
                  )*
                )
              )
            |
              (  #  ipathAbsolute
                /
                (?:
                  (?:
                    [
                      0-9A-Za-z\-\._~
                      \u00A0-\uD7FF
                      \uF900-\uFDCF
                      \uFDF0-\uFFEF
                      \u{10000}-\u{1FFFD}
                      \u{20000}-\u{2FFFD}
                      \u{30000}-\u{3FFFD}
                      \u{40000}-\u{4FFFD}
                      \u{50000}-\u{5FFFD}
                      \u{60000}-\u{6FFFD}
                      \u{70000}-\u{7FFFD}
                      \u{80000}-\u{8FFFD}
                      \u{90000}-\u{9FFFD}
                      \u{A0000}-\u{AFFFD}
                      \u{B0000}-\u{BFFFD}
                      \u{C0000}-\u{CFFFD}
                      \u{D0000}-\u{DFFFD}
                      \u{E0000}-\u{EFFFD}
                      !\$&'()*+,;=:@
                    ] | %[0-9A-Fa-f]{2}
                  )+
                  (?:
                    /
                    (?:
                      [
                        0-9A-Za-z\-\._~
                        \u00A0-\uD7FF
                        \uF900-\uFDCF
                        \uFDF0-\uFFEF
                        \u{10000}-\u{1FFFD}
                        \u{20000}-\u{2FFFD}
                        \u{30000}-\u{3FFFD}
                        \u{40000}-\u{4FFFD}
                        \u{50000}-\u{5FFFD}
                        \u{60000}-\u{6FFFD}
                        \u{70000}-\u{7FFFD}
                        \u{80000}-\u{8FFFD}
                        \u{90000}-\u{9FFFD}
                        \u{A0000}-\u{AFFFD}
                        \u{B0000}-\u{BFFFD}
                        \u{C0000}-\u{CFFFD}
                        \u{D0000}-\u{DFFFD}
                        \u{E0000}-\u{EFFFD}
                        !\$&'()*+,;=:@
                      ] | %[0-9A-Fa-f]{2}
                    )*
                  )*
                )?
              )
            |
              (  #  ipathRootless
                (?:
                  [
                    0-9A-Za-z\-\._~
                    \u00A0-\uD7FF
                    \uF900-\uFDCF
                    \uFDF0-\uFFEF
                    \u{10000}-\u{1FFFD}
                    \u{20000}-\u{2FFFD}
                    \u{30000}-\u{3FFFD}
                    \u{40000}-\u{4FFFD}
                    \u{50000}-\u{5FFFD}
                    \u{60000}-\u{6FFFD}
                    \u{70000}-\u{7FFFD}
                    \u{80000}-\u{8FFFD}
                    \u{90000}-\u{9FFFD}
                    \u{A0000}-\u{AFFFD}
                    \u{B0000}-\u{BFFFD}
                    \u{C0000}-\u{CFFFD}
                    \u{D0000}-\u{DFFFD}
                    \u{E0000}-\u{EFFFD}
                    !\$&'()*+,;=:@
                  ] | %[0-9A-Fa-f]{2}
                )+
                (?:
                  /
                  (?:
                    [
                      0-9A-Za-z\-\._~
                      \u00A0-\uD7FF
                      \uF900-\uFDCF
                      \uFDF0-\uFFEF
                      \u{10000}-\u{1FFFD}
                      \u{20000}-\u{2FFFD}
                      \u{30000}-\u{3FFFD}
                      \u{40000}-\u{4FFFD}
                      \u{50000}-\u{5FFFD}
                      \u{60000}-\u{6FFFD}
                      \u{70000}-\u{7FFFD}
                      \u{80000}-\u{8FFFD}
                      \u{90000}-\u{9FFFD}
                      \u{A0000}-\u{AFFFD}
                      \u{B0000}-\u{BFFFD}
                      \u{C0000}-\u{CFFFD}
                      \u{D0000}-\u{DFFFD}
                      \u{E0000}-\u{EFFFD}
                      !\$&'()*+,;=:@
                    ] | %[0-9A-Fa-f]{2}
                  )*
                )*
              )
            |
              (  #  ipathEmpty
              )
            )
            (?:
              \?
              (  #  iquery
                (?:
                  [
                    0-9A-Za-z\-\._~
                    \u00A0-\uD7FF
                    \uF900-\uFDCF
                    \uFDF0-\uFFEF
                    \u{10000}-\u{1FFFD}
                    \u{20000}-\u{2FFFD}
                    \u{30000}-\u{3FFFD}
                    \u{40000}-\u{4FFFD}
                    \u{50000}-\u{5FFFD}
                    \u{60000}-\u{6FFFD}
                    \u{70000}-\u{7FFFD}
                    \u{80000}-\u{8FFFD}
                    \u{90000}-\u{9FFFD}
                    \u{A0000}-\u{AFFFD}
                    \u{B0000}-\u{BFFFD}
                    \u{C0000}-\u{CFFFD}
                    \u{D0000}-\u{DFFFD}
                    \u{E0000}-\u{EFFFD}
                    !\$&'()*+,;=:@
                    \uE000-\uF8FF
                    \u{F0000}-\u{FFFFD}
                    \u{100000}-\u{10FFFD}
                    /?
                  ] | %[0-9A-Fa-f]{2}
                )*
              )
            )?
          )
          (?:
            \#
            (  #  ifragment
              (?:
                [
                  0-9A-Za-z\-\._~
                  \u00A0-\uD7FF
                  \uF900-\uFDCF
                  \uFDF0-\uFFEF
                  \u{10000}-\u{1FFFD}
                  \u{20000}-\u{2FFFD}
                  \u{30000}-\u{3FFFD}
                  \u{40000}-\u{4FFFD}
                  \u{50000}-\u{5FFFD}
                  \u{60000}-\u{6FFFD}
                  \u{70000}-\u{7FFFD}
                  \u{80000}-\u{8FFFD}
                  \u{90000}-\u{9FFFD}
                  \u{A0000}-\u{AFFFD}
                  \u{B0000}-\u{BFFFD}
                  \u{C0000}-\u{CFFFD}
                  \u{D0000}-\u{DFFFD}
                  \u{E0000}-\u{EFFFD}
                  !\$&'()*+,;=:@/?
                ] | %[0-9A-Fa-f]{2}
              )*
            )
          )?
          $
        ///u

##  The Constructor  ##

The `RFC3987()` constructor returns an object whose properties give the
  various components of the IRI, as strings.

        RFC3987 = (iri) ->
          [
            match
            absoluteIRI
            scheme
            ihierPart
            iauthority
            iuserinfo
            ihost
            IPLiteral
            IPv6address
            IPvFuture
            IPv4address
            iregName
            port
            ipathAbempty
            ipathAbsolute
            ipathRootless
            ipathEmpty
            iquery
            ifragment
          ] = (if iri then do iri.toString else "").match regex
          throw new TypeError "
            IRI not well-formed under RFC3987
          " unless match?

It is not required that `RFC3987()` be called as a constructor.

          Object.defineProperties (@ ? Object.create RFC3987ℙ),

##  Instance Properties  ##

###  `rfc3987.iri`:

The full IRI can be found on the `iri` property.

            iri:
              enumerable: yes
              value: match

###  `rfc3987.absolute`:

`absolute` holds the IRI, minus the fragment.

            absolute:
              enumerable: yes
              value: absoluteIRI

###  `rfc3987.scheme`:

`scheme` holds the scheme of the IRI.

            scheme:
              enumerable: yes
              value: scheme

###  `rfc3987.hierarchicalPart`:

`hierarchicalPart` holds the authority and/or path of the IRI.

            hierarchicalPart:
              enumerable: yes
              value: ihierPart

###  `rfc3987.authority`:

`authority` holds the authority of the IRI, if present.

            authority:
              enumerable: yes
              value: iauthority if iauthority?

###  `rfc3987.path`:

`path` holds the path of the IRI.

            path:
              enumerable: yes
              value: ipathAbempty ? ipathAbsolute ? ipathRootles ?
                ipathEmpty

###  `rfc3987.query`:

`query` holds the query of the IRI.
This does _not_ include the `?`.

            query:
              enumerable: yes
              value: iquery if iquery?

###  `rfc3987.fragment`:

`fragment` holds the fragment of the IRI.
This does _not_ include the `#`.

            fragment:
              enumerable: yes
              value: ifragment if ifragment?

##  The Prototype  ##

        Object.defineProperty RFC3987, "prototype",
          writable: no
          value: Object.defineProperties RFC3987ℙ = {},

##  Instance Methods  ##

###  `rfc3987.constructor()`:

`constructor()` is just the `RFC3987()` constructor.

            constructor: value: RFC3987

###  `rfc3987.toString()`:

The `toString()` method simply returns the `iri`.

            toString: value: ->
              if @iri? then do @iri.toString
              else "about:blank"

###  `rfc3987.valueOf()`:

`valueOf()` will attempt to create a `URL` object, and return the `iri`
  as a string if unsuccessful.

            valueOf: value: -> try new URL @iri catch then @iri

##  Constructor Properties  ##

###  `RFC3987.regex`:

The RFC3987 `regex` is available as a property on the `RFC3987()`
  constructor itself.

        Object.defineProperties RFC3987,
          regex:
            configurable: yes
            enumerable: yes
            value: regex

##  Constructor Methods  ##

###  `RFC3987.test(iri)`:

The `test()` function checks if a given string is a well-formed IRI,
  returning `true` or `false`.

          test:
            configurable: yes
            enumerable: yes
            value: (iri) -> regex.test iri

###  `RFC3987.testǃ(iri)`:

The `testǃ()` function does the same, but returns `undefined`, and
  throws an error if it is not.

          testǃ:
            configurable: yes
            enumerable: yes
            value: (iri) -> throw new TypeError "
              IRI is not well-formed according to RFC3987.
            " unless regex.test iri

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

_______________________________________________________________________

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
          [
            match
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
          ] = (if tag? then do tag.toString else "").match regex
          throw new TypeError "Language tag not well-formed under
            BCP47" unless match?

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

_______________________________________________________________________

<div align="right">
  <b><cite>ｍｅｒｍａｉｄ</cite></b><br />
  Source and Documentation<br />
  <code>Sources/Interfaces/Term.litcoffee</code>
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

#  RDF Terms  #

>   Reference specifications:
>   + <http://rdf.js.org/#term-interface>

A `Term` is an RDF "thing"; it can be a node, a literal, a variable, or
  a graph.
These are given the interfaces `NamedNode`, `BlankNode`, `Literal`,
  `Variable`, and `DefaultGraph`.

The constants `NAMED_NODE`,  `BLANK_NODE`, `LITERAL`, `VARIABLE`, and
  `DEFAULT_GRAPH` provide numeric identifiers for the different node
  types—this is a ｍｅｒｍａｉｄ extension.
`RDF_NODE` can be used to match any `RDFNode`.

    Object.defineProperties ｍｅｒｍａｉｄ,
      RDF_NODE:      value: RDF_NODE      = 0b000001
      NAMED_NODE:    value: NAMED_NODE    = 0b000011
      BLANK_NODE:    value: BLANK_NODE    = 0b000101
      LITERAL:       value: LITERAL       = 0b001001
      VARIABLE:      value: VARIABLE      = 0b010000
      DEFAULT_GRAPH: value: DEFAULT_GRAPH = 0b100000

ｍｅｒｍａｉｄ uses the internal `termTypes` variable to keep track of
  the strings associated with each constant.

    termTypes =
      [RDF_NODE]: "RDFNode"
      [NAMED_NODE]: "NamedNode"
      [BLANK_NODE]: "BlankNode"
      [LITERAL]: "Literal"
      [VARIABLE]: "Variable"
      [DEFAULT_GRAPH]: "DefaultGraph"

Terms are not _represented_ in ｍｅｒｍａｉｄ so much as they are
  _described_:
Multiple (distinct) JavaScript objects might describe the same RDF
  term.
Be sure to use the `equals()` method on terms, and not the `==` or
  `===` operators to compare them.

The `Term` interface provides an abstract constructor and prototype
  for RDF terms.
It is extended to create the constructors and prototypes for
  `RDFNode`, `Variable`, and `DefaultGraph`.
However, `Term` itself is not made available to the `ｍｅｒｍａｉｄ`
  object, and no objects should directly inherit from it on their
  prototype chain.

##  The Constructor  ##

The `Term` constructor takes two arguments:

+   __`type` :__
    One of the term type constants defined above.

+   __`value` :__
    The string value of the term.

    Term = (type, value) ->
      constructǃ @, Term, "Term"

##  Instance Properties  ##

      Object.defineProperties @,

###  `term.interfaceType`:

The `interfaceType` property gives the term type constant for this
  term, as a positive integer.
This is a ｍｅｒｍａｉｄ extension.

        interfaceType:
          configurable: yes
          enumerable: yes
          writable: no
          value: type >>> 0

###  `term.termType`:

The `termType` property gives the string value which corresponds to the
  term's `interfaceType`.

        termType:
          configurable: yes
          enumerable: yes
          writable: no
          get: -> termTypes[@interfaceType >>> 0]

###  `term.value`:

The `value` property gives the string representation of the term's
  value.

        value:
          configurable: yes
          enumerable: yes
          writable: no
          value: if value? then do value.toString else String value

##  The Prototype  ##

The `Term` prototype defines common methods which one can expect to
  find on any term.
However, the exact implementation of these methods may be overshadowed
  by more specific term constructors.

    Object.defineProperty Term, "prototype",
      writable: no
      value: Object.defineProperties Termℙ = {},

##  Instance Methods  ##

###  `term.constructor()`:

`Term`s are not constructable by outside forces, so the
  `constructor()` method is a fake constructor which always throws a
  `TypeError`.

        constructor: value: Ø "Term", Termℙ

###  `term.equals(other)`:

The `equals()` method attempts to determine if two `Term`s are
  equivalent.
To do this, it simply compares the two `Term` properties to see if
  they match.

        equals: value: (other) ->
          return (
            @interfaceType is other.interfaceType and
            @value is other.value
          ) if @ instanceof Term and other instanceof Term

If exactly one of `this` or `other` is not a `Term`, a strict
  equality check is done with the value of term's `toValue()` method,
  instead.

          if @ instanceof Term ^ other instanceof Term
            term = if @ instanceof Term then @ else other
            value = if @ is term then other else @
            return value is do term.toValue

If both `this` and `other` are `null` or `undefined`, they are
  considered equal.
Otherwise, `equals()` just does a straightforward strict equality
  check.

          !@? and !other? or @ is other

###  `term.toString()`:

The `toString()` method returns the string representation of the term's
  `value` property.
However, this method may be overshadowed by more specific term
  interfaces.

        toString: value: ->
          if (value = @?.value)? then do value.toString
          else String value

###  `term.valueOf()`:

The `valueOf()` method is identical to `toString()` for generic
  `Term`s, but may be different for more specific node interfaces.

        valueOf: value: Termℙ.toString

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

_______________________________________________________________________

<div align="right">
  <b><cite>ｍｅｒｍａｉｄ</cite></b><br />
  Source and Documentation<br />
  <code>Sources/Interfaces/RDFNode.litcoffee</code>
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

#  RDF Nodes  #

>   Reference specifications:
>   + <https://www.w3.org/TR/rdf-interfaces/#nodes>

`RDFNode` is the base class for `NamedNode`, `BlankNode`, and
  `Literal`.
It is a type of `Term`.

The `RDFNode` interface provides an abstract constructor and prototype
  for RDF nodes.
It is extended to create the constructors and prototypes for
  `NamedNode`, `BlankNode`, and `Literal`.
However, `RDFNode` itself is not made available to the `ｍｅｒｍａｉｄ`
  object, and no objects should directly inherit from it on their
  prototype chain.

##  The Constructor  ##

The `RDFNode` constructor takes two arguments:

+   __`type` :__
    One of the term type constants which are valid for nodes.

+   __`value` :__
    The value of the node.
    This may be any losslessly stringifyäble value.

    RDFNode = (type, value) ->
      constructǃ @, RDFNode, "RDFNode"

`RDFNode` inherits from `Term`:

      value = if value? then do value.toString else String value
      Term.call @, type ? RDF_NODE, value

##  Instance Properties  ##

      Object.defineProperties @,

###  `term.interfaceName`:

The `interfaceName` property gives the string value which corresponds
  to the node's `interfaceType`.
This should be identical to the `termType` property for `RDFNode`s.

        interfaceName:
          configurable: yes
          enumerable: yes
          writable: no
          get: -> termTypes[@interfaceType >>> 0]

###  `rdfNode.nominalValue`:

The `nominalValue` property gives the node's value.
This may be of any losslessly stringifyäble type.

        nominalValue:
          configurable: yes
          enumerable: yes
          writable: no
          value: value

###  `rdfNode.value`:

The `value` property gives the string representation of the node's
  value.

        value:
          configurable: yes
          enumerable: yes
          writable: no
          get: ->
            if @nominalValue? then do @nominalValue.toString
            else String(@nominalValue)

##  The Prototype  ##

The `RDFNode` prototype defines common methods which one can expect to
  find on any node.
However, the exact implementation of these methods may be overshadowed
  by more specific node constructors.

The `RDFNode` prototype inherits from that of `Term`.

    Object.defineProperty RDFNode, "prototype",
      writable: no
      value: Object.defineProperties RDFNodeℙ = (Object.create Termℙ),

##  Instance Methods  ##

###  `rdfNode.constructor()`:

`RDFNode`s are not constructable by outside forces, so the
  `constructor()` method is a fake constructor which always throws a
  `TypeError`.

      constructor: value: Ø "RDFNode", RDFNodeℙ

###  `rdfNode.toNT()`:

The `toNT()` method attempts to create an N-Triples representation of
  the instance node.
This method will be overshadowed by more specific node interfaces; for
  `RDFNode` it is identical to a double&hyphen;quoted `toString()`.

      toNT: value: -> "\"#{@}\""

###  `rdfNode.toString()`:

The `toString()` method returns the string representation of the node's
  `nominalValue` property.
However, this method may be overshadowed by more specific node
  interfaces.

      toString: value: ->
        if (value = @?.nominalValue)? then do value.toString
        else String value

###  `rdfNode.valueOf()`:

The `valueOf()` method is identical to `toString()` for generic
  `rdfNode`s, but may be different for more specific node interfaces.

      valueOf: value: RDFNodeℙ.toString

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

_______________________________________________________________________

<div align="right">
  <b><cite>ｍｅｒｍａｉｄ</cite></b><br />
  Source and Documentation<br />
  <code>Sources/Interfaces/NamedNode.litcoffee</code>
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

#  Named Nodes  #

>   Reference specifications:
>   + <https://www.w3.org/TR/rdf-interfaces/#named-nodes>
>   + <http://rdf.js.org/#namednode-interface>

Named RDF resources may be described using `NamedNode`s.
The name of a resource must be provided as an IRI.

##  The Constructor  ##

The `NamedNode` constructor takes one argument, `iri`, which provides
  the node's IRI as a RFC3987&hyphen;conforming string or `RFC3987`
  instance.

    NamedNode = (iri) ->
      constructǃ @, NamedNode, "NamedNode"

`NamedNode` extends `RDFNode`, which in turn extends `Term`.

      value = if iri instanceof RFC3987 then iri else new RFC3987 iri
      RDFNode.call @, NAMED_NODE, value

##  The Prototype  ##

The `NamedNode` prototype inherits from `RDFNode`.

    Object.defineProperty NamedNode, "prototype",
      writable: no
      value: Object.defineProperties NamedNodeℙ = (
        Object.create RDFNodeℙ
      ),

##  Instance Methods  ##

###  `namedNode.constructor()`:

`NamedNode`s are not constructable by outside forces, so the
  `constructor()` method is a fake constructor which always throws a
  `TypeError`.

        constructor: value: Ø "NamedNode", NamedNodeℙ

###  `namedNode.toNT()`:

The `toNT()` method just wraps the string value in `<` and `>` signs.

        toNT: value: -> "<#{@}>"

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

_______________________________________________________________________

<div align="right">
  <b><cite>ｍｅｒｍａｉｄ</cite></b><br />
  Source and Documentation<br />
  <code>Sources/Interfaces/BlankNode.litcoffee</code>
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

#  Blank Nodes  #

>   Reference specifications:
>   + <https://www.w3.org/TR/rdf-interfaces/#blank-nodes>
>   + <http://rdf.js.org/#blanknode-interface>

Unnamed RDF resources may be described using `BlankNode`s.

##  The Constructor  ##

The `BlankNode` constructor takes one argument, `identifier`, which
  provides the temporary identifier for the blank node, interpreted as
  a string.

    BlankNode = (identifier) ->
      constructǃ @, BlankNode, "BlankNode"

`BlankNode` extends `RDFNode`, which in turn extends `Term`.

      value = (
        if identifier? then do identifier.toString
        else String identifier
      )
      RDFNode.call @, BLANK_NODE, value

##  The Prototype  ##

The `BlankNode` prototype inherits from `RDFNode`.

    Object.defineProperty NamedNode, "prototype",
      writable: no
      value: Object.defineProperties BlankNodeℙ = (
        Object.create RDFNodeℙ
      ),

##  Instance Methods  ##

###  `blankNode.constructor()`:

`BlankNode`s are not constructable by outside forces, so the
  `constructor()` method is a fake constructor which always throws a
  `TypeError`.

        constructor: value: Ø "BlankNode", BlankNodeℙ

###  `blankNode.toNT()`:

The `toNT()` method functions like `blankNode.toString()`, except that
  characters not allowed in an N-Triples blank node identifier must be
  escaped.
This is (conservatively) handled by escaping invalid characters as
  `_XXXX`, where `XXXX` is the code point of the character, and by
  escaping the underscore as `__`.
Because JavaScript stores strings as UTF-16, characters outside the BMP
  will be escaped as surrogate pairs, even when they would otherwise be
  valid in an N-Triple blank node identifier.

        toNT: value: ->

The `escape()` function will turn a number into a string, padded with
  the appropriate number of zeros to be four digits long, and prefixed
  with an underscore.

          escape = (n) ->
            m = n.toString 16
            "_#{
              (new Array 4 - m.length)
              .fill 0
              .join ""
            }#{m}"

The `_:` prefix is added to the stringified, escaped `nominalValue`.

          "_:#{
            (
              if (value = @?.nominalValue)? then do value.toString
              else String value
            )

Underscores must be escaped.

            .replace /_/g, "__"

Periods must be escaped when they come at the beginning or end of a
  string.

            .replace /^.|.$/g, escape 0x2E

The hyphen, U+00B7, U+0300..U+036F, and U+203F..U+2040 must be escaped
  when they come at the beginning of a string.

            .replace ///^[
              -
              \xB7
              \u0300-\u036F
              \u203F-\u2040
            ]///g, (match) -> escape match.charCodeAt 0

Finally, any characters not allowed in the middle of the string must be
  escaped.

            .replace ///[^
              \-
              \.
              0-9
              A-Z
              _
              a-z
              \xB7
              \xC0-\xD6
              \xD8-\xF6
              \u00F8-\u037D
              \u037F-\u1FFF
              \u200C-\u200D
              \u203F-\u2040
              \u2070-\u218F
              \u2C00-\u2FEF
              \u3001-\uD7FF
              \uF900-\uFDCF
              \uFDF0-\uFFFD
            ]///g, (match) -> escape match.charCodeAt 0
          }"

###  `blankNode.toNT()`:

Blank nodes are stringified by prepending `"_:"`.
This does not affect `value`, `valueOf()`, or other string properties.

        toString: value: -> "_:#{if @? then do @.valueOf else @}"

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

_______________________________________________________________________

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
                return unless ///
                  ^[-+]?(?:\d+(?:\.\d*)?|\.\d+)$
                ///.test string
                +string if match?

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
                [
                  match
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
                ] = string.match ///
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
                [
                  match
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
                ] = string.match ///
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
                [
                  match
                  hour = 0
                  minute = 0
                  second = 0
                  twenty_four_hundred
                  time_zone_sign = "+"
                  time_zone_hour
                  time_zone_minute
                  time_zone_fourteen_hundred
                ] = string.match ///
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
                [
                  match
                  year
                  month
                  day
                  time_zone_sign = "+"
                  time_zone_hour
                  time_zone_minute
                  time_zone_fourteen_hundred
                ] = string.match ///
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
                return unless match
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
                [
                  match
                  year
                  month
                  time_zone_sign = "+"
                  time_zone_hour
                  time_zone_minute
                  time_zone_fourteen_hundred
                ] = string.match ///
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
                return unless match
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
                [
                  match
                  year
                  time_zone_sign = "+"
                  time_zone_hour
                  time_zone_minute
                  time_zone_fourteen_hundred
                ] = string.match ///
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
                return unless match
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
                [
                  match
                  month
                  day
                  time_zone_sign = "+"
                  time_zone_hour
                  time_zone_minute
                  time_zone_fourteen_hundred
                ] = string.match ///
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
                return unless match
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
                [
                  match
                  day
                  time_zone_sign = "+"
                  time_zone_hour
                  time_zone_minute
                  time_zone_fourteen_hundred
                ] = string.match ///
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
                return unless match
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
                [
                  match
                  month
                  time_zone_sign = "+"
                  time_zone_hour
                  time_zone_minute
                  time_zone_fourteen_hundred
                ] = string.match ///
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
                return unless match
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

_______________________________________________________________________

<div align="right">
  <b><cite>ｍｅｒｍａｉｄ</cite></b><br />
  Source and Documentation<br />
  <code>Sources/Interfaces/Variable.litcoffee</code>
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

#  Variables  #

>   Reference specifications:
>   + <http://rdf.js.org/#variable-interface>

Variables may be described using `Variable`s.

##  The Constructor  ##

The `Variable` constructor takes one argument, `name`, which provides
  the name of the variable.

    Variable = (name) ->
      constructǃ @, Variable, "Variable"

`Variable` extends `Term`.

      value = if name? then do name.toString else String name
      Term.call @, VARIABLE, value

##  The Prototype  ##

The `Variable` prototype inherits from `Term`.

    Object.defineProperty NamedNode, "prototype",
      writable: no
      value: Object.defineProperties Variableℙ = (Object.create Termℙ),

##  Instance Methods  ##

###  `variable.constructor()`:

`Variable`s are not constructable by outside forces, so the
  `constructor()` method is a fake constructor which always throws a
  `TypeError`.

        constructor: value: Ø "Variable", Variableℙ

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

_______________________________________________________________________

<div align="right">
  <b><cite>ｍｅｒｍａｉｄ</cite></b><br />
  Source and Documentation<br />
  <code>Sources/Interfaces/DefaultGraph.litcoffee</code>
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

#  Default Graphs  #

>   Reference specifications:
>   + <http://rdf.js.org/#defaultgraph-interface>

The default graph may be represented using an instance of
  `DefaultGraph`s.
All `DefaultGraph`s are the same.

##  The Constructor  ##

The `DefaultGraph` constructor doesn't take any arguments.

    DefaultGraph = ->
      constructǃ @, DefaultGraph, "DefaultGraph"

`Variable` extends `Term`.

      Term.call @, DEFAULT_GRAPH, ""

##  The Prototype  ##

The `DefaultGraph` prototype inherits from `Term`.

    Object.defineProperty DefaultGraph, "prototype",
      writable: no
      value: Object.defineProperties DefaultGraphℙ = (
        Object.create Termℙ
      ),

##  Instance Methods  ##

###  `defaultGraph.constructor()`:

`DefaultGraph`s are not constructable by outside forces, so the
  `constructor()` method is a fake constructor which always throws a
  `TypeError`.

        constructor: value: Ø "DefaultGraph", DefaultGraphℙ

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

_______________________________________________________________________

<div align="right">
  <b><cite>ｍｅｒｍａｉｄ</cite></b><br />
  Source and Documentation<br />
  <code>Sources/Interfaces/Quad.litcoffee</code>
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

#  Quads  #

>   Reference specifications:
>   + <http://rdf.js.org/#quad-interface>

A `Quad` associates a `subject`, `predicate`, and `object` with a graph
  and with each other.

##  The Constructor  ##

The `Quad` constructor takes four arguments:

+ __`subject` :__
  A `NamedNode`, `BlankNode`, or `Variable`.

+ __`predicate` :__
  A `NamedNode` or `Variable`.

+ __`object` :__
  A `NamedNode`, `Literal`, `BlankNode`, or `Variable`.

+ __`graph` :__
  A `DefaultGraph`, `NamedNode`, `BlankNode`, or `Variable`.

    Quad = (subject, predicate, object, graph = null) ->
      constructǃ @, Quad, "Quad"
      throw new TypeError "Invalid subject." unless (
        subject instanceof NamedNode or
        subject instanceof BlankNode or
        subject instanceof Variable
      )
      throw new TypeError "Invalid predicate." unless (
        predicate instanceof NamedNode or
        predicate instanceof Variable
      )
      throw new TypeError "Invalid object." unless (
        object instanceof NamedNode or
        object instanceof Literal or
        object instanceof BlankNode or
        object instanceof Variable
      )
      graph = new DefaultGraph unless (
        graph instanceof DefaultGraph or
        graph instanceof NamedNode or
        graph instanceof BlankNode or
        graph instanceof Variable
      )

##  Instance Properties  ##

      Object.defineProperties @,

###  `quad.graph`:

The graph of the `Quad`.

        graph:
          configurable: yes
          enumerable: yes
          writable: no
          value: graph

###  `quad.predicate`:

The predicate of the `Quad`.

        predicate:
          configurable: yes
          enumerable: yes
          writable: no
          value: predicate

###  `quad.object`:

The object of the `Quad`.

        object:
          configurable: yes
          enumerable: yes
          writable: no
          value: object

###  `quad.subject`:

The subject of the `Quad`.

        subject:
          configurable: yes
          enumerable: yes
          writable: no
          value: subject

##  The Prototype  ##

The `Quad` prototype defines quad equality and general functions.

    Object.defineProperty Quad, "prototype",
      writable: no
      value: Object.defineProperties Quadℙ = {},

##  Instance Methods  ##

###  `quad.constructor()`:

`Quad`s are not constructable by outside forces, so the
  `constructor()` method is a fake constructor which always throws a
  `TypeError`.

        constructor: value: Ø "Quad", Quadℙ

###  `quad.equals(other)`:

The `equals()` method attempts to determine if two `Quad`s are
  equivalent.
To do this, it simply compares the properties to see if they match.

        equals: value: (other) ->
          return !@? and !other? unless @? and other?
          return (
            Termℙ.equals.call @subject, other.subject
            Termℙ.equals.call @predicate, other.predicate
            Termℙ.equals.call @object, other.object
            Termℙ.equals.call @graph, other.graph
          ) if @ instanceof Quad and other instanceof Quad
          return false

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

_______________________________________________________________________

<div align="right">
  <b><cite>ｍｅｒｍａｉｄ</cite></b><br />
  Source and Documentation<br />
  <code>Sources/Interfaces/Triple.litcoffee</code>
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

#  Triples  #

>   Reference specifications:
>   + <https://www.w3.org/TR/rdf-interfaces/#triples>
>   + <http://rdf.js.org/#triple-interface>

A `Triple` is a kind of `Quad` where the `graph` is mandated to be a
  `DefaultGraph`.
Because of this, `Triple`s can be easily converted into N-Triples
  notation (which cannot support quads).

##  The Constructor  ##

The `Triple` constructor takes three arguments:

+ __`subject` :__
  A `NamedNode` or `BlankNode`.

+ __`predicate` :__
  A `NamedNode`.

+ __`object` :__
  A `NamedNode`, `Literal`, or `BlankNode`.

This is more restrictive than `Quad`.

    Triple = (subject, predicate, object) ->
      constructǃ @, Quad, "Quad"
      throw new TypeError "Invalid subject." unless (
        subject instanceof NamedNode or
        subject instanceof BlankNode
      )
      throw new TypeError "Invalid predicate." unless (
        predicate instanceof NamedNode
      )
      throw new TypeError "Invalid object." unless (
        object instanceof NamedNode or
        object instanceof Literal or
        object instanceof BlankNode
      )
      Quad.call @, subject, predicate, object

##  The Prototype  ##

The `Triple` prototype inherits from `Quad`.

    Object.defineProperty Triple, "prototype",
      writable: no
      value: Object.defineProperties Tripleℙ = (Object.create Quadℙ),

##  Instance Methods  ##

###  `triple.constructor()`:

`Triple`s are not constructable by outside forces, so the
  `constructor()` method is a fake constructor which always throws a
  `TypeError`.

        constructor: value: Ø "Triple", Tripleℙ

###  `triple.toString()`:

The `toString()` method returns the triple as an N-Triple.

        toString: value: ->
          return Object::toString.call @ unless (
            typeof (subjectNT = @?.subject?.toNT) is "function" and
            typeof (predicateNT = @?.predicate?.toNT) is "function" and
            typeof (objectNT = @?.objectNT?.toNT) is "function"
          )
          "#{do subjectNT} #{do predicateNT} #{do objectNT} ."

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

_______________________________________________________________________

<div align="right">
  <b><cite>ｍｅｒｍａｉｄ</cite></b><br />
  Source and Documentation<br />
  <code>Sources/Interfaces/DataFactory.litcoffee</code>
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

#  Data Factories  #

>   Reference specifications:
>   + <http://rdf.js.org/#datafactory-interface>

A `DataFactory` allows for the creation of various interface objects.

The `nextBlankNode` internal variable gives a numeric index for use
  when auto&hyphen;naming blank nodes.

    nextBlankNode = 0

##  The Constructor  ##

The `DataFactory` constructor takes no arguments:

    DataFactory = ->
      constructǃ @, DataFactory, "DataFactory"

##  The Prototype  ##

The `DataFactory` prototype defines factory functions for the various
  interfaces.

    Object.defineProperty DataFactory, "prototype",
      writable: no
      value: Object.defineProperties DataFactoryℙ = {},

##  Instance Methods  ##

###  `dataFactory.constructor()`:

`DataFactory`s are not constructable by outside forces, so the
  `constructor()` method is a fake constructor which always throws a
  `TypeError`.

        constructor: value: Ø "DataFactory", DataFactoryℙ

###  `dataFactory.namedNode(value)`:

`namedNode()` produces a `NamedNode`.

        namedNode: value: (value) -> new NamedNode value

###  `dataFactory.blankNode(value)`:

`blankNode()` produces a `BlankNode`.
If not present, a name will be auto&hyphen;generated&#mdash;but
  ｍｅｒｍａｉｄ is not able to guarantee that it will be unique.

        blankNode: value: (value) -> new BlankNode (
          value ? "#{SIGIL}#{nextBlankNode++}"
        )

###  `dataFactory.literal(value,languageOrDatatype)`:

`literal()` produces a `Literal`.
`languageOrDatatype` is interpreted as a datatype if it is a
  `NamedNode`, and a language string otherwise, if present.

        literal: value: (value, languageOrDatatype) ->
          if languageOrDatatype instanceof NamedNode
            datatype = languageOrDatatype
          else lang = langaugeOrDatatype
          new Literal value, lang, datatype

###  `dataFactory.variable(value)`:

`variable()` produces a `Variable`.

        variable: value: (value) -> new Variable value

###  `dataFactory.defaultGraph()`:

`defaultGraph()` produces a `DefaultGraph`.

        defaultGraph: value: -> new DefaultGraph

###  `dataFactory.triple(subject,predicate,object)`:

`triple()` produces a `Triple`.

        triple: value: -> new Triple subject, predicate, object

###  `dataFactory.quad(subject,predicate,object,graph)`:

`quad()` produces a `Quad`.
`graph` will default to a `DefaultGraph` if not provided.

        quad: value: -> new Quad subject, predicate, object, graph

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

_______________________________________________________________________

<div align="right">
  <b><cite>ｍｅｒｍａｉｄ</cite></b><br />
  Source and Documentation<br />
  <code>Sources/Interfaces/ωSETUP.litcoffee</code>
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

#  Final Interfaces Setup  #

This file after our interfaces have all been loaded to set them up.

    Object.defineProperties ｍｅｒｍａｉｄ,

ｍｅｒｍａｉｄ makes a `DataFactory` instance available at
  `ｍｅｒｍａｉｄ.create`.

      create:
        configurable: yes
        enumerated: yes
        writable: no
        value: new DataFactory

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
