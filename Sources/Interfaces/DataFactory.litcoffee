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
If not present, a name will be auto&hyphen;generated&mdash;but
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
