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
              [A-Za-z]
              [A-Za-z0-9+\-\.]*
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
          match = (if iri then do iri.toString else "").match regex
          throw new TypeError "
            IRI <#{iri}> not well-formed under RFC3987
          " unless match?
          [ match
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
          ] = match

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
