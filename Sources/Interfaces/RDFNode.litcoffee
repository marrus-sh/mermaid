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
