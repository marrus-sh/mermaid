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
