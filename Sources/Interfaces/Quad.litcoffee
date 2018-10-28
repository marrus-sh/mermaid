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
