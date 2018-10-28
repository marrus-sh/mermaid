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

`DefaultGraph` extends `Term`.

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
