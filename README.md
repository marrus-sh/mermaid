#  ｍｅｒｍａｉｄ  #

**ｍｅｒｍａｉｄ** is an RDF and Linked Data library, written and
  maintained by Kyebego as a personal project.
It builds on the spirit of specifications like [_RDF Interfaces_][RDFI]
  (W3C Working Group Note, never finished) and
  [_Interface Specification: RDF Representation_][RDFJS] (Draft
  Community Group Report, not an actual W3C specification), only
  updated for RDF 1.1 and the latest in web technologies.

Designed for use in client&hyphen;side and unhosted applications and
  publishing tools.
**Not** designed for server&hyphen;side operations, for which a more
  rigourous RDF library should be used if maintaining compleat
  correctness is important.

##  Ｆｅａｔｕｒｅｓ  ##

+ Written in CoffeeScript 2
+ [Literate source](./Sources/)
+ Compiles to ECMAScript 5.1
+ Extensible
+ Programmed with gay sensibilities
+ GPLv3 License

##  Ｌｉｍｉｔａｔｉｏｎｓ  ##

For simplicity, ｍｅｒｍａｉｄ lacks a true [XSD][XSD11-2] engine,
  which means that some things, like `xsd:float`, might suffer from
  minor rounding errors or approximations.
If you're a server and need a complete assurance that the data you are
  dealing with is valid and interpreted according to its XSD datatype,
  this library is probably not for you.

The full value of `xsd:long` and `xsd:unsignedLong` cannot fit in a
  JavaScript number without rounding and ｍｅｒｍａｉｄ makes no
  attempt to get around this.

ｍｅｒｍａｉｄ does *not* support the XSD datatypes which are listed
  in _RDF 1.1 Concepts and Abstract Syntax_ as “unsuitable for various
  reasons”.
These are: `xsd:QName`, `xsd:ENTITY`, `xsd:ID`, `xsd:IDREF`,
  `xsd:NOTATION`, `xsd:IDREFS`, `xsd:ENTITIES`, and `xsd:NMTOKENS`.

Finally, ｍｅｒｍａｉｄ does *not* support `xsd:duration` or the values
  derived from it, as JavaScript has no native means of expressing
  durations.

##  Ｓｔａｎｄａｒｄｓ  ##

+ [_Extensible Markup Language (XML) 1.1 (Second Edition)_][XML11]
+ [_Interface Specification: RDF Representation_][RDFJS]
+ [_Internationalized Resource Identifiers (IRIs)_][RFC3987]
+ [_RDF 1.1 Concepts and Abstract Syntax_][RDF11-Concepts]
+ [_RDF 1.1 N-Triples_][NT11]
+ [_RDF 1.1 Turtle_][Turtle11]
+ [_RDF Interfaces_ (WG Note)][RDFI]
+ [_Tags for Identifying Languages_][BCP47]

##  ＨｏｗＴｏ  ##

If you really want to understand how to use `ｍｅｒｍａｉｄ`, you
  should [read the source](./Sources/) (but like, the English parts,
  not the code).
The documents are organized by specification, so if you know what
  you're looking for, things hopefully won't be too hard to find.

I'll try to put together a _Tutorial_ that is a little more
  beginner&hyphen;friendly to approach once I'm satisfied with the
  state of the code and have spare time.

##  ＳｅｅＡｌｓｏ  ##

If mermaids kissing beneath the ocean waves makes you feel
  uncomfortable, maybe check out [RDF Interfaces Extension][RDF-Ext]
  instead.

##  Ｃｏｎｔｒｉｂｕｔｉｎｇ  ##

It's open source so that you can modify the code before you run it on
  your own computer, not so that you can modify the code before I run
  it on mine ^.^

Feel free to fork if you think it needs something, tho (-_^)〜☆

[BCP47]:          <https://tools.ietf.org/html/bcp47>
[RDF-EXT]:        <https://github.com/rdf-ext/rdf-ext>
[RDF11-Concepts]: <https://www.w3.org/TR/rdf11-concepts/>
[RDFI]:           <https://www.w3.org/TR/rdf-interfaces/>
[RDFJS]:          <http://rdf.js.org/>
[RFC3987]:        <https://tools.ietf.org/html/rfc3987>
[NT11]:           <https://www.w3.org/TR/2014/REC-n-triples-20140225/>
[Turtle11]:       <https://www.w3.org/TR/turtle/>
[XML11]:          <https://www.w3.org/TR/xml11/>
[XSD11-2]:        <https://www.w3.org/TR/xmlschema11-2/>
