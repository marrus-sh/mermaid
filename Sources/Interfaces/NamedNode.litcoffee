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
