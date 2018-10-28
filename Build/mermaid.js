/*
ｍｅｒｍａｉｄ: An RDF library for JavaScript
Copyright (C) 2018 Kyebego

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

The GNU General Public License is available online at
<https://www.gnu.org/licenses/>.
*/
"use strict";

function _slicedToArray(arr, i) { return _arrayWithHoles(arr) || _iterableToArrayLimit(arr, i) || _nonIterableRest(); }

function _nonIterableRest() { throw new TypeError("Invalid attempt to destructure non-iterable instance"); }

function _iterableToArrayLimit(arr, i) { var _arr = []; var _n = true; var _d = false; var _e = undefined; try { for (var _i = arr[Symbol.iterator](), _s; !(_n = (_s = _i.next()).done); _n = true) { _arr.push(_s.value); if (i && _arr.length === i) break; } } catch (err) { _d = true; _e = err; } finally { try { if (!_n && _i["return"] != null) _i["return"](); } finally { if (_d) throw _e; } } return _arr; }

function _arrayWithHoles(arr) { if (Array.isArray(arr)) return arr; }

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

(function () {
  var _termTypes;

  var BCP47, BCP47ℙ, BLANK_NODE, _BlankNode, BlankNodeℙ, DEFAULT_GRAPH, _DataFactory, DataFactoryℙ, _DefaultGraph, DefaultGraphℙ, LITERAL, Literal, Literalℙ, NAMED_NODE, _NamedNode, NamedNodeℙ, _Quad, Quadℙ, _RDFNode, RDFNodeℙ, RDF_NODE, RFC3987, RFC3987ℙ, SIGIL, _Term, Termℙ, Triple, Tripleℙ, VARIABLE, _Variable, Variableℙ, constructǃ, global, nextBlankNode, ref, termTypes, Ø, Ｍｅｒｍａｉｄ, ｍｅｒｍａｉｄ;

  global = (ref = typeof self !== "undefined" && self !== null ? self : window) != null ? ref : exports;

  if (!global) {
    throw new ReferenceError("Unknown global object.");
  }

  constructǃ = function construct(context, constructor, type) {
    if (context == null) {
      throw new TypeError("".concat(type, " must be called as a constructor."));
    }

    if (!(context instanceof constructor)) {
      throw new TypeError("This is not a ".concat(type, "."));
    }
  };

  Ø = function _() {
    var identifier = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : "anonymous";
    var ℙ = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : Object.prototype;
    var obj;
    obj = _defineProperty({}, identifier, function () {
      throw new TypeError("Illegal constructor.");
    });
    return Object.defineProperty(obj[identifier], "prototype", {
      configurable: false,
      value: ℙ,
      writable: false
    });
  };

  Object.defineProperty((Ｍｅｒｍａｉｄ = function _() {}).prototype, "constructor", {
    configurable: false,
    value: Ø("Ｍｅｒｍａｉｄ", Ｍｅｒｍａｉｄ.prototype),
    writable: false
  });
  ｍｅｒｍａｉｄ = new Ｍｅｒｍａｉｄ();

  SIGIL = function () {
    var _Object$definePropert;

    var FEMALE, MALE, MERPERSON, VS16, WAVE, ZWJ;
    MALE = "\u2642";
    MERPERSON = "\uD83E\uDDDC";
    FEMALE = "\u2640";
    VS16 = "\uFE0F";
    WAVE = "\uD83C\uDF0A";
    ZWJ = "\u200D";
    Object.defineProperties(global, (_Object$definePropert = {
      ｍｅｒｍａｉｄ: {
        configurable: true,
        value: ｍｅｒｍａｉｄ
      }
    }, _defineProperty(_Object$definePropert, "".concat(MERPERSON).concat(WAVE), {
      configurable: true,
      value: ｍｅｒｍａｉｄ
    }), _defineProperty(_Object$definePropert, "".concat(MERPERSON).concat(ZWJ).concat(FEMALE).concat(VS16).concat(WAVE), {
      configurable: true,
      value: ｍｅｒｍａｉｄ
    }), _defineProperty(_Object$definePropert, "".concat(MERPERSON).concat(ZWJ).concat(MALE).concat(VS16).concat(WAVE), {
      configurable: false,
      value: null
    }), _Object$definePropert));
    return "".concat(MERPERSON).concat(WAVE);
  }();

  Object.defineProperties(ｍｅｒｍａｉｄ, {
    ℹ: {
      value: "https://go.KIBI.family/mermaid/"
    },
    Nº: {
      value: Object.freeze({
        major: 0,
        minor: 1,
        patch: 0,
        toString: function toString() {
          return "".concat(this.major, ".").concat(this.minor, ".").concat(this.patch);
        },
        valueOf: function valueOf() {
          return this.major * 100 + this.minor + this.patch / 100;
        }
      })
    }
  });
  RFC3987 = RFC3987ℙ = void 0;
  Object.defineProperty(ｍｅｒｍａｉｄ, "RFC3987", {
    configurable: true,
    enumerable: true,
    value: function () {
      var regex;
      regex = /^(():(\/\/((?:((?:(?:[!\$&-\.0-;=A-Z_a-z~\xA0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[\uD800-\uD83E\uD840-\uD87E\uD880-\uD8BE\uD8C0-\uD8FE\uD900-\uD93E\uD940-\uD97E\uD980-\uD9BE\uD9C0-\uD9FE\uDA00-\uDA3E\uDA40-\uDA7E\uDA80-\uDABE\uDAC0-\uDAFE\uDB00-\uDB3E\uDB40-\uDB7E][\uDC00-\uDFFF]|[\uD83F\uD87F\uD8BF\uD8FF\uD93F\uD97F\uD9BF\uD9FF\uDA3F\uDA7F\uDABF\uDAFF\uDB3F\uDB7F][\uDC00-\uDFFD])|%[0-9A-Fa-f]{2})*)@)?((\[((?:[0-9A-Fa-f]{1,4}:){6}(?:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}|(?:(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))|::(?:[0-9A-Fa-f]{1,4}:){5}(?:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}|(?:(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))|(?:[0-9A-Fa-f]{1,4})?::(?:[0-9A-Fa-f]{1,4}:){4}(?:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}|(?:(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))|(?:(?:[0-9A-Fa-f]{1,4}:)?[0-9A-Fa-f]{1,4})?::(?:[0-9A-Fa-f]{1,4}:){3}(?:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}|(?:(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))|(?:(?:[0-9A-Fa-f]{1,4}:){0,2}[0-9A-Fa-f]{1,4})?::(?:[0-9A-Fa-f]{1,4}:){2}(?:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}|(?:(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))|(?:(?:[0-9A-Fa-f]{1,4}:){0,3}[0-9A-Fa-f]{1,4})?::(?:[0-9A-Fa-f]{1,4}:)(?:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}|(?:(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))|(?:(?:[0-9A-Fa-f]{1,4}:){0,4}[0-9A-Fa-f]{1,4})?::(?:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}|(?:(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))|(?:(?:[0-9A-Fa-f]{1,4}:){0,5}[0-9A-Fa-f]{1,4})?::[0-9A-Fa-f]{1,4}(?:(?:[0-9A-Fa-f]{1,4}:){0,6}[0-9A-Fa-f]{1,4})?::)|(v[0-9A-Fa-f]+\.[!\$&-\.0-;=A-Z_a-z~]+)\])|((?:(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))|((?:(?:[!\$&-\.0-9;=A-Z_a-z~\xA0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[\uD800-\uD83E\uD840-\uD87E\uD880-\uD8BE\uD8C0-\uD8FE\uD900-\uD93E\uD940-\uD97E\uD980-\uD9BE\uD9C0-\uD9FE\uDA00-\uDA3E\uDA40-\uDA7E\uDA80-\uDABE\uDAC0-\uDAFE\uDB00-\uDB3E\uDB40-\uDB7E][\uDC00-\uDFFF]|[\uD83F\uD87F\uD8BF\uD8FF\uD93F\uD97F\uD9BF\uD9FF\uDA3F\uDA7F\uDABF\uDAFF\uDB3F\uDB7F][\uDC00-\uDFFD])|%[0-9A-Fa-f]{2})*))(?::([0-9]*))?((?:\/(?:(?:[!\$&-\.0-;=@-Z_a-z~\xA0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[\uD800-\uD83E\uD840-\uD87E\uD880-\uD8BE\uD8C0-\uD8FE\uD900-\uD93E\uD940-\uD97E\uD980-\uD9BE\uD9C0-\uD9FE\uDA00-\uDA3E\uDA40-\uDA7E\uDA80-\uDABE\uDAC0-\uDAFE\uDB00-\uDB3E\uDB40-\uDB7E][\uDC00-\uDFFF]|[\uD83F\uD87F\uD8BF\uD8FF\uD93F\uD97F\uD9BF\uD9FF\uDA3F\uDA7F\uDABF\uDAFF\uDB3F\uDB7F][\uDC00-\uDFFD])|%[0-9A-Fa-f]{2})*)*))|(\/(?:(?:(?:[!\$&-\.0-;=@-Z_a-z~\xA0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[\uD800-\uD83E\uD840-\uD87E\uD880-\uD8BE\uD8C0-\uD8FE\uD900-\uD93E\uD940-\uD97E\uD980-\uD9BE\uD9C0-\uD9FE\uDA00-\uDA3E\uDA40-\uDA7E\uDA80-\uDABE\uDAC0-\uDAFE\uDB00-\uDB3E\uDB40-\uDB7E][\uDC00-\uDFFF]|[\uD83F\uD87F\uD8BF\uD8FF\uD93F\uD97F\uD9BF\uD9FF\uDA3F\uDA7F\uDABF\uDAFF\uDB3F\uDB7F][\uDC00-\uDFFD])|%[0-9A-Fa-f]{2})+(?:\/(?:(?:[!\$&-\.0-;=@-Z_a-z~\xA0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[\uD800-\uD83E\uD840-\uD87E\uD880-\uD8BE\uD8C0-\uD8FE\uD900-\uD93E\uD940-\uD97E\uD980-\uD9BE\uD9C0-\uD9FE\uDA00-\uDA3E\uDA40-\uDA7E\uDA80-\uDABE\uDAC0-\uDAFE\uDB00-\uDB3E\uDB40-\uDB7E][\uDC00-\uDFFF]|[\uD83F\uD87F\uD8BF\uD8FF\uD93F\uD97F\uD9BF\uD9FF\uDA3F\uDA7F\uDABF\uDAFF\uDB3F\uDB7F][\uDC00-\uDFFD])|%[0-9A-Fa-f]{2})*)*)?)|((?:(?:[!\$&-\.0-;=@-Z_a-z~\xA0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[\uD800-\uD83E\uD840-\uD87E\uD880-\uD8BE\uD8C0-\uD8FE\uD900-\uD93E\uD940-\uD97E\uD980-\uD9BE\uD9C0-\uD9FE\uDA00-\uDA3E\uDA40-\uDA7E\uDA80-\uDABE\uDAC0-\uDAFE\uDB00-\uDB3E\uDB40-\uDB7E][\uDC00-\uDFFF]|[\uD83F\uD87F\uD8BF\uD8FF\uD93F\uD97F\uD9BF\uD9FF\uDA3F\uDA7F\uDABF\uDAFF\uDB3F\uDB7F][\uDC00-\uDFFD])|%[0-9A-Fa-f]{2})+(?:\/(?:(?:[!\$&-\.0-;=@-Z_a-z~\xA0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[\uD800-\uD83E\uD840-\uD87E\uD880-\uD8BE\uD8C0-\uD8FE\uD900-\uD93E\uD940-\uD97E\uD980-\uD9BE\uD9C0-\uD9FE\uDA00-\uDA3E\uDA40-\uDA7E\uDA80-\uDABE\uDAC0-\uDAFE\uDB00-\uDB3E\uDB40-\uDB7E][\uDC00-\uDFFF]|[\uD83F\uD87F\uD8BF\uD8FF\uD93F\uD97F\uD9BF\uD9FF\uDA3F\uDA7F\uDABF\uDAFF\uDB3F\uDB7F][\uDC00-\uDFFD])|%[0-9A-Fa-f]{2})*)*)|())(?:\?((?:(?:[!\$&-;=\?-Z_a-z~\xA0-\uD7FF\uE000-\uFDCF\uFDF0-\uFFEF]|[\uD800-\uD83E\uD840-\uD87E\uD880-\uD8BE\uD8C0-\uD8FE\uD900-\uD93E\uD940-\uD97E\uD980-\uD9BE\uD9C0-\uD9FE\uDA00-\uDA3E\uDA40-\uDA7E\uDA80-\uDABE\uDAC0-\uDAFE\uDB00-\uDB3E\uDB40-\uDB7E\uDB80-\uDBBE\uDBC0-\uDBFE][\uDC00-\uDFFF]|[\uD83F\uD87F\uD8BF\uD8FF\uD93F\uD97F\uD9BF\uD9FF\uDA3F\uDA7F\uDABF\uDAFF\uDB3F\uDB7F\uDBBF\uDBFF][\uDC00-\uDFFD])|%[0-9A-Fa-f]{2})*))?)(?:#((?:(?:[!\$&-;=\?-Z_a-z~\xA0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[\uD800-\uD83E\uD840-\uD87E\uD880-\uD8BE\uD8C0-\uD8FE\uD900-\uD93E\uD940-\uD97E\uD980-\uD9BE\uD9C0-\uD9FE\uDA00-\uDA3E\uDA40-\uDA7E\uDA80-\uDABE\uDAC0-\uDAFE\uDB00-\uDB3E\uDB40-\uDB7E][\uDC00-\uDFFF]|[\uD83F\uD87F\uD8BF\uD8FF\uD93F\uD97F\uD9BF\uD9FF\uDA3F\uDA7F\uDABF\uDAFF\uDB3F\uDB7F][\uDC00-\uDFFD])|%[0-9A-Fa-f]{2})*))?$/;

      RFC3987 = function RFC3987(iri) {
        var IPLiteral, IPv4address, IPv6address, IPvFuture, absoluteIRI, iauthority, ifragment, ihierPart, ihost, ipathAbempty, ipathAbsolute, ipathEmpty, ipathRootless, iquery, iregName, iuserinfo, match, port, ref1, ref2, scheme;

        var _match = (iri ? iri.toString() : "").match(regex);

        var _match2 = _slicedToArray(_match, 19);

        match = _match2[0];
        absoluteIRI = _match2[1];
        scheme = _match2[2];
        ihierPart = _match2[3];
        iauthority = _match2[4];
        iuserinfo = _match2[5];
        ihost = _match2[6];
        IPLiteral = _match2[7];
        IPv6address = _match2[8];
        IPvFuture = _match2[9];
        IPv4address = _match2[10];
        iregName = _match2[11];
        port = _match2[12];
        ipathAbempty = _match2[13];
        ipathAbsolute = _match2[14];
        ipathRootless = _match2[15];
        ipathEmpty = _match2[16];
        iquery = _match2[17];
        ifragment = _match2[18];

        if (match == null) {
          throw new TypeError("IRI not well-formed under RFC3987");
        }

        return Object.defineProperties(this != null ? this : Object.create(RFC3987ℙ), {
          iri: {
            enumerable: true,
            value: match
          },
          absolute: {
            enumerable: true,
            value: absoluteIRI
          },
          scheme: {
            enumerable: true,
            value: scheme
          },
          hierarchicalPart: {
            enumerable: true,
            value: ihierPart
          },
          authority: {
            enumerable: true,
            value: iauthority != null ? iauthority : void 0
          },
          path: {
            enumerable: true,
            value: (ref1 = (ref2 = ipathAbempty != null ? ipathAbempty : ipathAbsolute) != null ? ref2 : ipathRootles) != null ? ref1 : ipathEmpty
          },
          query: {
            enumerable: true,
            value: iquery != null ? iquery : void 0
          },
          fragment: {
            enumerable: true,
            value: ifragment != null ? ifragment : void 0
          }
        });
      };

      Object.defineProperty(RFC3987, "prototype", {
        writable: false,
        value: Object.defineProperties(RFC3987ℙ = {}, {
          constructor: {
            value: RFC3987
          },
          toString: {
            value: function value() {
              if (this.iri != null) {
                return this.iri.toString();
              } else {
                return "about:blank";
              }
            }
          },
          valueOf: {
            value: function value() {
              try {
                return new URL(this.iri);
              } catch (error) {
                return this.iri;
              }
            }
          }
        })
      });
      return Object.defineProperties(RFC3987, {
        regex: {
          configurable: true,
          enumerable: true,
          value: regex
        },
        test: {
          configurable: true,
          enumerable: true,
          value: function value(iri) {
            return regex.test(iri);
          }
        },
        testǃ: {
          configurable: true,
          enumerable: true,
          value: function value(iri) {
            if (!regex.test(iri)) {
              throw new TypeError("IRI is not well-formed according to RFC3987.");
            }
          }
        }
      });
    }()
  });
  BCP47 = BCP47ℙ = void 0;
  Object.defineProperty(ｍｅｒｍａｉｄ, "BCP47", {
    configurable: true,
    enumerable: true,
    value: function () {
      var regex;
      regex = /^(?:(([A-Za-z]{2,3}(-[A-Za-z]{3}(?:-[A-Za-z]{3}){0,2})?|[A-Za-z]{4,8})(?:-([A-Za-z]{4}))?(?:-([A-Za-z]{2}|\d{3}))?(?:-([0-9A-Za-z]{5,8}|\d[0-9A-Za-z]{3}(?:-[0-9A-Za-z]{5,8}|\d[0-9A-Za-z]{3})*))?(?:-([0-9A-WY-Za-wy-z](?:-[0-9A-Za-z]{2,8})+(?:-[0-9A-WY-Za-wy-z](?:-[0-9A-Za-z]{2,8})+)*))?(?:-(x(?:-[0-9A-Za-z]{2,8})+))?)|(x(?:-[0-9A-Za-z]{2,8})+)|(en-GB-oed|i-(?:ami|bnn|default|enochian|hak|klingon|lux|mingo|navajo|pwn|tao|tay|tsu)|sgn-(?:BE-FR|BE-NL|CH-DE)))?$/;

      BCP47 = function BCP47(tag) {
        var extension, extlang, grandfathered, langtag, language, match, privateuse, privateuseonly, ref1, ref2, ref3, region, script, variant;

        var _match3 = (tag != null ? tag.toString() : "").match(regex);

        var _match4 = _slicedToArray(_match3, 11);

        match = _match4[0];
        langtag = _match4[1];
        language = _match4[2];
        extlang = _match4[3];
        script = _match4[4];
        region = _match4[5];
        variant = _match4[6];
        extension = _match4[7];
        privateuse = _match4[8];
        privateuseonly = _match4[9];
        grandfathered = _match4[10];

        if (match == null) {
          throw new TypeError("Language tag not well-formed under BCP47");
        }

        return Object.defineProperties(this != null ? this : Object.create(BCP47ℙ), {
          langtag: {
            enumerable: true,
            value: (ref1 = (ref2 = langtag != null ? langtag : privateuseonly) != null ? ref2 : grandfathered) != null ? ref1 : ""
          },
          language: {
            enumerable: true,
            value: language != null ? language : ""
          },
          extlang: {
            enumerable: true,
            value: extlang != null ? extlang : ""
          },
          script: {
            enumerable: true,
            value: script != null ? script : ""
          },
          region: {
            enumerable: true,
            value: region != null ? region : ""
          },
          variant: {
            enumerable: true,
            value: variant != null ? variant : ""
          },
          extension: {
            enumerable: true,
            value: extension != null ? extension : ""
          },
          privateuse: {
            enumerable: true,
            value: (ref3 = privateuse != null ? privateuse : privateuseonly) != null ? ref3 : ""
          }
        });
      };

      Object.defineProperty(BCP47, "prototype", {
        writable: false,
        value: Object.defineProperties(BCP47ℙ = {}, {
          constructor: {
            value: BCP47
          },
          toString: {
            value: function value() {
              if (this.langtag != null) {
                return this.langtag.toString();
              } else {
                return "";
              }
            }
          },
          valueOf: {
            value: function value() {
              return this.langtag;
            }
          }
        })
      });
      return Object.defineProperties(BCP47, {
        regex: {
          configurable: true,
          enumerable: true,
          value: regex
        },
        test: {
          configurable: true,
          enumerable: true,
          value: function value(tag) {
            return regex.test(tag);
          }
        },
        testǃ: {
          configurable: true,
          enumerable: true,
          value: function value(tag) {
            if (!regex.test(tag)) {
              throw new TypeError("Language tag is not well-formed according to BCP47.");
            }
          }
        }
      });
    }()
  });
  Object.defineProperties(ｍｅｒｍａｉｄ, {
    RDF_NODE: {
      value: RDF_NODE = 1
    },
    NAMED_NODE: {
      value: NAMED_NODE = 3
    },
    BLANK_NODE: {
      value: BLANK_NODE = 5
    },
    LITERAL: {
      value: LITERAL = 9
    },
    VARIABLE: {
      value: VARIABLE = 16
    },
    DEFAULT_GRAPH: {
      value: DEFAULT_GRAPH = 32
    }
  });
  termTypes = (_termTypes = {}, _defineProperty(_termTypes, RDF_NODE, "RDFNode"), _defineProperty(_termTypes, NAMED_NODE, "NamedNode"), _defineProperty(_termTypes, BLANK_NODE, "BlankNode"), _defineProperty(_termTypes, LITERAL, "Literal"), _defineProperty(_termTypes, VARIABLE, "Variable"), _defineProperty(_termTypes, DEFAULT_GRAPH, "DefaultGraph"), _termTypes);

  _Term = function Term(type, value) {
    constructǃ(this, _Term, "Term");
    return Object.defineProperties(this, {
      interfaceType: {
        configurable: true,
        enumerable: true,
        writable: false,
        value: type >>> 0
      },
      termType: {
        configurable: true,
        enumerable: true,
        writable: false,
        get: function get() {
          return termTypes[this.interfaceType >>> 0];
        }
      },
      value: {
        configurable: true,
        enumerable: true,
        writable: false,
        value: value != null ? value.toString() : String(value)
      }
    });
  };

  Object.defineProperty(_Term, "prototype", {
    writable: false,
    value: Object.defineProperties(Termℙ = {}, {
      constructor: {
        value: Ø("Term", Termℙ)
      },
      equals: {
        value: function value(other) {
          var term, value;

          if (this instanceof _Term && other instanceof _Term) {
            return this.interfaceType === other.interfaceType && this.value === other.value;
          }

          if (this instanceof _Term ^ other instanceof _Term) {
            term = this instanceof _Term ? this : other;
            value = this === term ? other : this;
            return value === term.toValue();
          }

          return this == null && other == null || this === other;
        }
      },
      toString: {
        value: function value() {
          var value;

          if ((value = this != null ? this.value : void 0) != null) {
            return value.toString();
          } else {
            return String(value);
          }
        }
      },
      valueOf: {
        value: Termℙ.toString
      }
    })
  });

  _RDFNode = function RDFNode(type, value) {
    constructǃ(this, _RDFNode, "RDFNode");
    value = value != null ? value.toString() : String(value);

    _Term.call(this, type != null ? type : RDF_NODE, value);

    return Object.defineProperties(this, {
      interfaceName: {
        configurable: true,
        enumerable: true,
        writable: false,
        get: function get() {
          return termTypes[this.interfaceType >>> 0];
        }
      },
      nominalValue: {
        configurable: true,
        enumerable: true,
        writable: false,
        value: value
      },
      value: {
        configurable: true,
        enumerable: true,
        writable: false,
        get: function get() {
          if (this.nominalValue != null) {
            return this.nominalValue.toString();
          } else {
            return String(this.nominalValue);
          }
        }
      }
    });
  };

  Object.defineProperty(_RDFNode, "prototype", {
    writable: false,
    value: Object.defineProperties(RDFNodeℙ = Object.create(Termℙ), {
      constructor: {
        value: Ø("RDFNode", RDFNodeℙ)
      },
      toNT: {
        value: function value() {
          return "\"".concat(this, "\"");
        }
      },
      toString: {
        value: function value() {
          var value;

          if ((value = this != null ? this.nominalValue : void 0) != null) {
            return value.toString();
          } else {
            return String(value);
          }
        }
      },
      valueOf: {
        value: RDFNodeℙ.toString
      }
    })
  });

  _NamedNode = function NamedNode(iri) {
    var value;
    constructǃ(this, _NamedNode, "NamedNode");
    value = iri instanceof RFC3987 ? iri : new RFC3987(iri);
    return _RDFNode.call(this, NAMED_NODE, value);
  };

  Object.defineProperty(_NamedNode, "prototype", {
    writable: false,
    value: Object.defineProperties(NamedNodeℙ = Object.create(RDFNodeℙ), {
      constructor: {
        value: Ø("NamedNode", NamedNodeℙ)
      },
      toNT: {
        value: function value() {
          return "<".concat(this, ">");
        }
      }
    })
  });

  _BlankNode = function BlankNode(identifier) {
    var value;
    constructǃ(this, _BlankNode, "BlankNode");
    value = identifier != null ? identifier.toString() : String(identifier);
    return _RDFNode.call(this, BLANK_NODE, value);
  };

  Object.defineProperty(_NamedNode, "prototype", {
    writable: false,
    value: Object.defineProperties(BlankNodeℙ = Object.create(RDFNodeℙ), {
      constructor: {
        value: Ø("BlankNode", BlankNodeℙ)
      },
      toNT: {
        value: function value() {
          var escape, value;

          escape = function escape(n) {
            var m;
            m = n.toString(16);
            return "_".concat(new Array(4 - m.length).fill(0).join("")).concat(m);
          };

          return "_:".concat(((value = this != null ? this.nominalValue : void 0) != null ? value.toString() : String(value)).replace(/_/g, "__").replace(/^.|.$/g, escape(0x2E)).replace(/^[-\xB7\u0300-\u036F\u203F-\u2040]/g, function (match) {
            return escape(match.charCodeAt(0));
          }).replace(/[^\-\.0-9A-Z_a-z\xB7\xC0-\xD6\xD8-\xF6\u00F8-\u037D\u037F-\u1FFF\u200C-\u200D\u203F-\u2040\u2070-\u218F\u2C00-\u2FEF\u3001-\uD7FF\uF900-\uFDCF\uFDF0-\uFFFD]/g, function (match) {
            return escape(match.charCodeAt(0));
          }));
        }
      },
      toString: {
        value: function value() {
          return "_:".concat(this != null ? this.valueOf() : this);
        }
      }
    })
  });

  Literal = function () {
    var rdfǀlangString, xsdǀstring;
    rdfǀlangString = new _NamedNode("http://www.w3.org/1999/02/22-rdf-syntax-ns#langString");
    xsdǀstring = new _NamedNode("http://www.w3.org/2001/XMLSchema#string");
    return function (value) {
      var lang = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : "";
      var datatype = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : xsdǀstring;
      constructǃ(this, Literal, "Literal");
      value = value != null ? value.toString() : String(value);

      _RDFNode.call(this, LITERAL, value);

      return Object.defineProperties(this, {
        datatype: {
          configurable: true,
          enumerable: true,
          writable: false,
          value: lang ? rdfǀlangString : type instanceof _NamedNode ? type : new _NamedNode(type)
        },
        lang: {
          configurable: true,
          enumerable: true,
          writable: false,
          value: lang instanceof BCP47 ? lang : new BCP47(lang != null ? lang : "")
        },
        language: {
          configurable: true,
          enumerable: true,
          writable: false,
          get: function get() {
            if (this.lang) {
              return this.lang.toString().toLowerCase();
            } else {
              return "";
            }
          }
        }
      });
    };
  }();

  Object.defineProperty(Literal, "prototype", {
    writable: false,
    value: Object.defineProperties(Literalℙ = Object.create(RDFNodeℙ), {
      constructor: {
        value: Ø("Literal", Literalℙ)
      },
      equals: {
        value: function value(other) {
          var ref1, ref2;

          if (this instanceof Literal && other instanceof Literal) {
            return this.interfaceType === other.interfaceType && this.nominalValue === other.nominalValue && ((ref1 = this.language) != null ? ref1 : "") === ((ref2 = other.language) != null ? ref2 : "") && Termℙ.equals.call(this.datatype, other.datatype);
          } else {
            return Termℙ.equals.call(this, other);
          }
        }
      },
      toNT: {
        value: function () {
          var uesc;

          uesc = function uesc(n) {
            var m;
            m = n.toString(16);

            if (n < 0x10000) {
              return "\\u".concat(new Array(4 - m.length).fill(0).join("")).concat(m);
            } else {
              return "\\U".concat(new Array(8 - m.length).fill(0).join("")).concat(m);
            }
          };

          return function () {
            var language, type, value;
            value = ((value = this != null ? this.nominalValue : void 0) != null ? value.toString() : String(value)).replace(/[\\"]/g, function (char) {
              return "\\".concat(char);
            }).replace(/\r/g, "\\r").replace(/\n/g, "\\n");

            if (!(language = this != null ? this.language : void 0)) {
              type = ((value = this != null ? this.nominalValue : void 0) != null ? value.toString() : String(value)).replace(/[\x00-\x20<>"{}|^`\\]/g, function (char) {
                return uesc(char);
              }).replace(/[\uD800-\uDBFF][\uDC00-\uDFFF]/g, function (_ref) {
                var _ref2 = _slicedToArray(_ref, 2),
                    H = _ref2[0],
                    L = _ref2[1];

                return uesc((H - 0xD800) * 0x400 + L - 0xDC00 + 0x10000);
              });
            }

            switch (false) {
              case !language:
                return "\"".concat(value, "\"@").concat(language);

              case type === "http://www.w3.org/2001/XMLSchema#string":
                return "\"".concat(value, "\"^^").concat(type);

              default:
                return "\"".concat(value, "\"");
            }
          };
        }()
      },
      valueOf: {
        value: function () {
          var collapse, dateFromDateTime, preserve, replace, xmlBadCharRegex;
          xmlBadCharRegex = /(?:[\0\uFFFE\uFFFF]|[\uD800-\uDBFF](?![\uDC00-\uDFFF])|(?:[^\uD800-\uDBFF]|^)[\uDC00-\uDFFF])/;

          preserve = function preserve(string) {
            if (string == null) {
              return;
            }

            string = string.toString();

            if (!xmlBadCharRegex.test(string)) {
              return string;
            }
          };

          replace = function replace(string) {
            if (string == null) {
              return;
            }

            string = string.toString().replace(/[\t\n\r ]+/g, " ");

            if (!xmlBadCharRegex.test(string)) {
              return string;
            }
          };

          collapse = function collapse(string) {
            if (string == null) {
              return;
            }

            string = string.toString().replace(/[\t\n\r ]+/g, " ").replace(/^ | $/g, "");

            if (!xmlBadCharRegex.test(string)) {
              return string;
            }
          };

          dateFromDateTime = function dateFromDateTime() {
            var year = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : 1972;
            var month = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : 12;
            var day = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : null;
            var hour = arguments.length > 3 && arguments[3] !== undefined ? arguments[3] : 0;
            var minute = arguments.length > 4 && arguments[4] !== undefined ? arguments[4] : 0;
            var second = arguments.length > 5 && arguments[5] !== undefined ? arguments[5] : 0;
            var timezoneOffset = arguments.length > 6 && arguments[6] !== undefined ? arguments[6] : null;
            var endOfDay = arguments.length > 7 && arguments[7] !== undefined ? arguments[7] : false;
            var date;

            if (isNaN(year = +year)) {
              return;
            }

            if (isNaN(month = +month)) {
              return;
            }

            if (day == null) {
              day = function () {
                switch (month) {
                  case 2:
                    if (year % 4 && (!(year % 100) || year % 400)) {
                      return 28;
                    } else {
                      return 29;
                    }

                    break;

                  case 4:
                  case 6:
                  case 9:
                  case 11:
                    return 30;

                  default:
                    return 31;
                }
              }();
            } else {
              if (day = +day) {
                return;
              }
            }

            if (day > 30 && (month === 4 || month === 6 || month === 9 || month === 11) || day > 29 && month === 2 || day > 28 && month === 2 && (!(year % 4) || year % 100 && !(year % 400))) {
              return;
            }

            if (isNaN(hour = +hour)) {
              return;
            }

            if (isNaN(minute = +minute)) {
              return;
            }

            if (isNaN(second = +second)) {
              return;
            }

            date = new Date(year, month - 1, day, hour, minute, second >> 0, second * 1000 % 1000);

            if (date && 0 <= year && year < 100) {
              date.setFullYear(year);
            }

            if (date != null && endOfDay != null) {
              date = new Date(+date + 24 * 60 * 60000);
            }

            if (date != null && isFinite(timezoneOffset)) {
              return new Date(+date + (timezoneOffset - date.getTimezoneOffset()) * 60000);
            } else {
              return date;
            }
          };

          return function () {
            var literal, ref1, type, value;
            type = (ref1 = this != null ? this.datatype : void 0) != null ? ref1 : "";

            literal = function () {
              var value;

              if ((value = this != null ? this.nominalValue : void 0) != null) {
                return value.toString();
              } else {
                return String(value);
              }
            }();

            value = function () {
              var array, base64Map, char, day, hour, i, index, j, len, match, minute, month, next24Bits, number, offset, pos, ref10, ref2, ref3, ref4, ref5, ref6, ref7, ref8, ref9, second, size, string, time_zone_fourteen_hundred, time_zone_hour, time_zone_minute, time_zone_sign, timezoneOffset, twenty_four_hundred, uri, year;

              switch (type.toString()) {
                case "http://www.w3.org/2001/XMLSchema#string":
                  return preserve(literal);

                case "http://www.w3.org/1999/02/22-rdf-syntax-ns#langString":
                  return literal;

                case "http://www.w3.org/2001/XMLSchema#normalizedString":
                  return replace(literal);

                case "http://www.w3.org/2001/XMLSchema#token":
                  return collapse(literal);

                case "http://www.w3.org/2001/XMLSchema#language":
                  if ((string = collapse(literal)) == null) {
                    return;
                  }

                  if (/^[a-zA-Z]{1,8}(?:-[a-zA-Z0-9]{1,8})*$/.test(string)) {
                    return string;
                  }

                  break;

                case "http://www.w3.org/2001/XMLSchema#NMTOKEN":
                  if ((string = collapse(literal)) == null) {
                    return;
                  }

                  if (/^(?:[\x2D\.0-:A-Z_a-z\xB7\xC0-\xD6\xD8-\xF6\xF8-\u037D\u037F-\u1FFF\u200C\u200D\u203F\u2040\u2070-\u218F\u2C00-\u2FEF\u3001-\uD7FF\uF900-\uFDCF\uFDF0-\uFFFD]|[\uD800-\uDB7F][\uDC00-\uDFFF])+$/.test(string)) {
                    return string;
                  }

                  break;

                case "http://www.w3.org/2001/XMLSchema#Name":
                  if ((string = collapse(literal)) == null) {
                    return;
                  }

                  if (/^(?:[:A-Z_a-z\xC0-\xD6\xD8-\xF6\xF8-\u02FF\u0370-\u037D\u037F-\u1FFF\u200C\u200D\u2070-\u218F\u2C00-\u2FEF\u3001-\uD7FF\uF900-\uFDCF\uFDF0-\uFFFD]|[\uD800-\uDB7F][\uDC00-\uDFFF])(?:[\x2D\.0-:A-Z_a-z\xB7\xC0-\xD6\xD8-\xF6\xF8-\u037D\u037F-\u1FFF\u200C\u200D\u203F\u2040\u2070-\u218F\u2C00-\u2FEF\u3001-\uD7FF\uF900-\uFDCF\uFDF0-\uFFFD]|[\uD800-\uDB7F][\uDC00-\uDFFF])*$/.test(string)) {
                    return string;
                  }

                  break;

                case "http://www.w3.org/2001/XMLSchema#NCName":
                  if ((string = collapse(literal)) == null) {
                    return;
                  }

                  if (/^(?:[A-Z_a-z\xC0-\xD6\xD8-\xF6\xF8-\u02FF\u0370-\u037D\u037F-\u1FFF\u200C\u200D\u2070-\u218F\u2C00-\u2FEF\u3001-\uD7FF\uF900-\uFDCF\uFDF0-\uFFFD]|[\uD800-\uDB7F][\uDC00-\uDFFF])(?:[\x2D\.0-9A-Z_a-z\xB7\xC0-\xD6\xD8-\xF6\xF8-\u037D\u037F-\u1FFF\u200C\u200D\u203F\u2040\u2070-\u218F\u2C00-\u2FEF\u3001-\uD7FF\uF900-\uFDCF\uFDF0-\uFFFD]|[\uD800-\uDB7F][\uDC00-\uDFFF])*$/.test(string)) {
                    return string;
                  }

                  break;

                case "http://www.w3.org/2001/XMLSchema#boolean":
                  switch (collapse(literal)) {
                    case "true":
                    case "1":
                      return true;

                    case "false":
                    case "0":
                      return false;
                  }

                  break;

                case "http://www.w3.org/2001/XMLSchema#decimal":
                  if ((string = collapse(literal)) == null) {
                    return;
                  }

                  if (!/^[-+]?(?:\d+(?:\.\d*)?|\.\d+)$/.test(string)) {
                    return;
                  }

                  if (typeof match !== "undefined" && match !== null) {
                    return +string;
                  }

                  break;

                case "http://www.w3.org/2001/XMLSchema#integer":
                  if ((string = collapse(literal)) == null) {
                    return;
                  }

                  if (/^[-+]?\d+$/.test(string)) {
                    return +string;
                  }

                  break;

                case "http://www.w3.org/2001/XMLSchema#positiveInteger":
                  if ((string = collapse(literal)) == null) {
                    return;
                  }

                  if (!/^[-+]?\d+$/.test(string)) {
                    return;
                  }

                  if (1 <= (number = +string)) {
                    return number;
                  }

                  break;

                case "http://www.w3.org/2001/XMLSchema#nonNegativeInteger":
                  if ((string = collapse(literal)) == null) {
                    return;
                  }

                  if (!/^[-+]?\d+$/.test(string)) {
                    return;
                  }

                  if (0 <= (number = +string)) {
                    return number;
                  }

                  break;

                case "http://www.w3.org/2001/XMLSchema#negativeInteger":
                  if ((string = collapse(literal)) == null) {
                    return;
                  }

                  if (!/^[-+]?\d+$/.test(string)) {
                    return;
                  }

                  if ((number = +string) <= -1) {
                    return number;
                  }

                  break;

                case "http://www.w3.org/2001/XMLSchema#nonPositiveInteger":
                  if ((string = collapse(literal)) == null) {
                    return;
                  }

                  if (!/^[-+]?\d+$/.test(string)) {
                    return;
                  }

                  if ((number = +string) <= 0) {
                    return number;
                  }

                  break;

                case "http://www.w3.org/2001/XMLSchema#long":
                  if ((string = collapse(literal)) == null) {
                    return;
                  }

                  if (!/^[-+]?\d+$/.test(string)) {
                    return;
                  }

                  if (9223372036854775808 <= (ref2 = number = +string) && ref2 <= 9223372036854775807) {
                    return number;
                  }

                  break;

                case "http://www.w3.org/2001/XMLSchema#unsignedLong":
                  if ((string = collapse(literal)) == null) {
                    return;
                  }

                  if (!/^[-+]?\d+$/.test(string)) {
                    return;
                  }

                  if (0 <= (ref3 = number = +string) && ref3 <= 18446744073709551615) {
                    return number;
                  }

                  break;

                case "http://www.w3.org/2001/XMLSchema#int":
                  if ((string = collapse(literal)) == null) {
                    return;
                  }

                  if (!/^[-+]?\d+$/.test(string)) {
                    return;
                  }

                  if (1 << 31 <= (ref4 = number = +string) && ref4 <= ~(1 << 31)) {
                    return number;
                  }

                  break;

                case "http://www.w3.org/2001/XMLSchema#unsignedInt":
                  if ((string = collapse(literal)) == null) {
                    return;
                  }

                  if (!/^[-+]?\d+$/.test(string)) {
                    return;
                  }

                  if (0 <= (ref5 = number = +string) && ref5 <= 4294967295) {
                    return number;
                  }

                  break;

                case "http://www.w3.org/2001/XMLSchema#short":
                  if ((string = collapse(literal)) == null) {
                    return;
                  }

                  if (!/^[-+]?\d+$/.test(string)) {
                    return;
                  }

                  if (-32768 <= (ref6 = number = +string) && ref6 <= 32767) {
                    return number;
                  }

                  break;

                case "http://www.w3.org/2001/XMLSchema#unsignedShort":
                  if ((string = collapse(literal)) == null) {
                    return;
                  }

                  if (!/^[-+]?\d+$/.test(string)) {
                    return;
                  }

                  if (0 <= (ref7 = number = +string) && ref7 <= 65535) {
                    return number;
                  }

                  break;

                case "http://www.w3.org/2001/XMLSchema#byte":
                  if ((string = collapse(literal)) == null) {
                    return;
                  }

                  if (!/^[-+]?\d+$/.test(string)) {
                    return;
                  }

                  if (-128 <= (ref8 = number = +string) && ref8 <= 127) {
                    return number;
                  }

                  break;

                case "http://www.w3.org/2001/XMLSchema#unsignedByte":
                  if ((string = collapse(literal)) == null) {
                    return;
                  }

                  if (!/^[-+]?\d+$/.test(string)) {
                    return;
                  }

                  if (0 <= (ref9 = number = +string) && ref9 <= 255) {
                    return number;
                  }

                  break;

                case "http://www.w3.org/2001/XMLSchema#float":
                case "http://www.w3.org/2001/XMLSchema#double":
                  switch (string = collapse(literal)) {
                    case "NaN":
                      return 0 / 0;

                    case "INF":
                      return +2e308;

                    case "-INF":
                      return -2e308;

                    default:
                      if (string != null && /(\+|-)?([0-9]+(\.[0-9]*)?|\.[0-9]+)([Ee](\+|-)?[0-9]+)?/.test(string)) {
                        return +string;
                      }

                  }

                  break;

                case "http://www.w3.org/2001/XMLSchema#dateTime":
                  if ((string = collapse(literal)) == null) {
                    return;
                  }

                  var _string$match = string.match(/^(-?(?:[1-9][0-9]{3,}|0[0-9]{3}))-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])T(([01][0-9]|2[0-3]):([0-5][0-9]):((?:[0-5][0-9])(?:\.(?:[0-9]+))?)|(24:00:00(?:\.0+)?))(?:Z|(\+|-)(?:(0[0-9]|1[0-3]):([0-5][0-9])|(14:00)))?$/);

                  var _string$match2 = _slicedToArray(_string$match, 12);

                  match = _string$match2[0];
                  year = _string$match2[1];
                  month = _string$match2[2];
                  day = _string$match2[3];
                  var _string$match2$ = _string$match2[4];
                  hour = _string$match2$ === void 0 ? 0 : _string$match2$;
                  var _string$match2$2 = _string$match2[5];
                  minute = _string$match2$2 === void 0 ? 0 : _string$match2$2;
                  var _string$match2$3 = _string$match2[6];
                  second = _string$match2$3 === void 0 ? 0 : _string$match2$3;
                  twenty_four_hundred = _string$match2[7];
                  var _string$match2$4 = _string$match2[8];
                  time_zone_sign = _string$match2$4 === void 0 ? "+" : _string$match2$4;
                  time_zone_hour = _string$match2[9];
                  time_zone_minute = _string$match2[10];
                  time_zone_fourteen_hundred = _string$match2[11];

                  if (match == null) {
                    return;
                  }

                  if (time_zone_hour != null && time_zone_minute != null) {
                    timezoneOffset = time_zone_hour * 60 + +time_zone_minute;
                  } else if (time_zone_fourteen_hundred != null) {
                    timezoneOffset = 14 * 60;
                  }

                  if (time_zone_sign === "-") {
                    timezoneOffset = -timezoneOffset;
                  }

                  return dateFromDateTime(year, month, day, hour, minute, second, timezoneOffset, twenty_four_hundred != null);

                case "http://www.w3.org/2001/XMLSchema#dateTimeStamp":
                  if ((string = collapse(literal)) == null) {
                    return;
                  }

                  var _string$match3 = string.match(/^(-?(?:[1-9][0-9]{3,}|0[0-9]{3}))-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])T(([01][0-9]|2[0-3]):([0-5][0-9]):((?:[0-5][0-9])(?:\.(?:[0-9]+))?)|(24:00:00(?:\.0+)?))(?:Z|(\+|-)(?:(0[0-9]|1[0-3]):([0-5][0-9])|(14:00)))$/);

                  var _string$match4 = _slicedToArray(_string$match3, 12);

                  match = _string$match4[0];
                  year = _string$match4[1];
                  month = _string$match4[2];
                  day = _string$match4[3];
                  var _string$match4$ = _string$match4[4];
                  hour = _string$match4$ === void 0 ? 0 : _string$match4$;
                  var _string$match4$2 = _string$match4[5];
                  minute = _string$match4$2 === void 0 ? 0 : _string$match4$2;
                  var _string$match4$3 = _string$match4[6];
                  second = _string$match4$3 === void 0 ? 0 : _string$match4$3;
                  twenty_four_hundred = _string$match4[7];
                  var _string$match4$4 = _string$match4[8];
                  time_zone_sign = _string$match4$4 === void 0 ? "+" : _string$match4$4;
                  time_zone_hour = _string$match4[9];
                  time_zone_minute = _string$match4[10];
                  time_zone_fourteen_hundred = _string$match4[11];

                  if (match == null) {
                    return;
                  }

                  if (time_zone_hour != null && time_zone_minute != null) {
                    timezoneOffset = time_zone_hour * 60 + +time_zone_minute;
                  } else if (time_zone_fourteen_hundred != null) {
                    timezoneOffset = 14 * 60;
                  }

                  if (time_zone_sign === "-") {
                    timezoneOffset = -timezoneOffset;
                  }

                  return dateFromDateTime(year, month, day, hour, minute, second, timezoneOffset, twenty_four_hundred != null);

                case "http://www.w3.org/2001/XMLSchema#time":
                  if ((string = collapse(literal)) == null) {
                    return;
                  }

                  var _string$match5 = string.match(/^(([01][0-9]|2[0-3]):([0-5][0-9]):((?:[0-5][0-9])(?:\.(?:[0-9]+))?)|(24:00:00(?:\.0+)?))(?:Z|(\+|-)(?:(0[0-9]|1[0-3]):([0-5][0-9])|(14:00)))?$/);

                  var _string$match6 = _slicedToArray(_string$match5, 9);

                  match = _string$match6[0];
                  var _string$match6$ = _string$match6[1];
                  hour = _string$match6$ === void 0 ? 0 : _string$match6$;
                  var _string$match6$2 = _string$match6[2];
                  minute = _string$match6$2 === void 0 ? 0 : _string$match6$2;
                  var _string$match6$3 = _string$match6[3];
                  second = _string$match6$3 === void 0 ? 0 : _string$match6$3;
                  twenty_four_hundred = _string$match6[4];
                  var _string$match6$4 = _string$match6[5];
                  time_zone_sign = _string$match6$4 === void 0 ? "+" : _string$match6$4;
                  time_zone_hour = _string$match6[6];
                  time_zone_minute = _string$match6[7];
                  time_zone_fourteen_hundred = _string$match6[8];

                  if (match == null) {
                    return;
                  }

                  if (time_zone_hour != null && time_zone_minute != null) {
                    timezoneOffset = time_zone_hour * 60 + +time_zone_minute;
                  } else if (time_zone_fourteen_hundred != null) {
                    timezoneOffset = 14 * 60;
                  }

                  if (time_zone_sign === "-") {
                    timezoneOffset = -timezoneOffset;
                  }

                  return dateFromDateTime(1972, 12, 31, hour, minute, second, timezoneOffset, twenty_four_hundred != null);

                case "http://www.w3.org/2001/XMLSchema#date":
                  if ((string = collapse(literal)) == null) {
                    return;
                  }

                  var _string$match7 = string.match(/^(-?(?:[1-9][0-9]{3,}|0[0-9]{3}))-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])(?:Z|(\+|-)(?:(0[0-9]|1[0-3]):([0-5][0-9])|(14:00)))?$/);

                  var _string$match8 = _slicedToArray(_string$match7, 8);

                  match = _string$match8[0];
                  year = _string$match8[1];
                  month = _string$match8[2];
                  day = _string$match8[3];
                  var _string$match8$ = _string$match8[4];
                  time_zone_sign = _string$match8$ === void 0 ? "+" : _string$match8$;
                  time_zone_hour = _string$match8[5];
                  time_zone_minute = _string$match8[6];
                  time_zone_fourteen_hundred = _string$match8[7];

                  if (!match) {
                    return;
                  }

                  if (time_zone_hour != null && time_zone_minute != null) {
                    timezoneOffset = time_zone_hour * 60 + +time_zone_minute;
                  } else if (time_zone_fourteen_hundred != null) {
                    timezoneOffset = 14 * 60;
                  }

                  if (time_zone_sign === "-") {
                    timezoneOffset = -timezoneOffset;
                  }

                  return dateFromDateTime(year, month, day, 0, 0, 0, timezoneOffset);

                case "http://www.w3.org/2001/XMLSchema#gYearMonth":
                  if ((string = collapse(literal)) == null) {
                    return;
                  }

                  var _string$match9 = string.match(/^(-?(?:[1-9][0-9]{3,}|0[0-9]{3}))-(0[1-9]|1[0-2])(?:Z|(\+|-)(?:(0[0-9]|1[0-3]):([0-5][0-9])|(14:00)))?$/);

                  var _string$match10 = _slicedToArray(_string$match9, 7);

                  match = _string$match10[0];
                  year = _string$match10[1];
                  month = _string$match10[2];
                  var _string$match10$ = _string$match10[3];
                  time_zone_sign = _string$match10$ === void 0 ? "+" : _string$match10$;
                  time_zone_hour = _string$match10[4];
                  time_zone_minute = _string$match10[5];
                  time_zone_fourteen_hundred = _string$match10[6];

                  if (!match) {
                    return;
                  }

                  if (time_zone_hour != null && time_zone_minute != null) {
                    timezoneOffset = time_zone_hour * 60 + +time_zone_minute;
                  } else if (time_zone_fourteen_hundred != null) {
                    timezoneOffset = 14 * 60;
                  }

                  if (time_zone_sign === "-") {
                    timezoneOffset = -timezoneOffset;
                  }

                  return dateFromDateTime(year, month, null, 0, 0, 0, timezoneOffset);

                case "http://www.w3.org/2001/XMLSchema#gYear":
                  if ((string = collapse(literal)) == null) {
                    return;
                  }

                  var _string$match11 = string.match(/^(-?(?:[1-9][0-9]{3,}|0[0-9]{3}))(?:Z|(\+|-)(?:(0[0-9]|1[0-3]):([0-5][0-9])|(14:00)))?$/);

                  var _string$match12 = _slicedToArray(_string$match11, 6);

                  match = _string$match12[0];
                  year = _string$match12[1];
                  var _string$match12$ = _string$match12[2];
                  time_zone_sign = _string$match12$ === void 0 ? "+" : _string$match12$;
                  time_zone_hour = _string$match12[3];
                  time_zone_minute = _string$match12[4];
                  time_zone_fourteen_hundred = _string$match12[5];

                  if (!match) {
                    return;
                  }

                  if (time_zone_hour != null && time_zone_minute != null) {
                    timezoneOffset = time_zone_hour * 60 + +time_zone_minute;
                  } else if (time_zone_fourteen_hundred != null) {
                    timezoneOffset = 14 * 60;
                  }

                  if (time_zone_sign === "-") {
                    timezoneOffset = -timezoneOffset;
                  }

                  return dateFromDateTime(year, 12, 31, 0, 0, 0, timezoneOffset);

                case "http://www.w3.org/2001/XMLSchema#gMonthDay":
                  if ((string = collapse(literal)) == null) {
                    return;
                  }

                  var _string$match13 = string.match(/^--(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])(?:Z|(\+|-)(?:(0[0-9]|1[0-3]):([0-5][0-9])|(14:00)))?$/);

                  var _string$match14 = _slicedToArray(_string$match13, 7);

                  match = _string$match14[0];
                  month = _string$match14[1];
                  day = _string$match14[2];
                  var _string$match14$ = _string$match14[3];
                  time_zone_sign = _string$match14$ === void 0 ? "+" : _string$match14$;
                  time_zone_hour = _string$match14[4];
                  time_zone_minute = _string$match14[5];
                  time_zone_fourteen_hundred = _string$match14[6];

                  if (!match) {
                    return;
                  }

                  if (time_zone_hour != null && time_zone_minute != null) {
                    timezoneOffset = time_zone_hour * 60 + +time_zone_minute;
                  } else if (time_zone_fourteen_hundred != null) {
                    timezoneOffset = 14 * 60;
                  }

                  if (time_zone_sign === "-") {
                    timezoneOffset = -timezoneOffset;
                  }

                  return dateFromDateTime(1972, month, day, 0, 0, 0, timezoneOffset);

                case "http://www.w3.org/2001/XMLSchema#gDay":
                  if ((string = collapse(literal)) == null) {
                    return;
                  }

                  var _string$match15 = string.match(/^---(0[1-9]|[12][0-9]|3[01])(?:Z|(\+|-)(?:(0[0-9]|1[0-3]):([0-5][0-9])|(14:00)))?$/);

                  var _string$match16 = _slicedToArray(_string$match15, 6);

                  match = _string$match16[0];
                  day = _string$match16[1];
                  var _string$match16$ = _string$match16[2];
                  time_zone_sign = _string$match16$ === void 0 ? "+" : _string$match16$;
                  time_zone_hour = _string$match16[3];
                  time_zone_minute = _string$match16[4];
                  time_zone_fourteen_hundred = _string$match16[5];

                  if (!match) {
                    return;
                  }

                  if (time_zone_hour != null && time_zone_minute != null) {
                    timezoneOffset = time_zone_hour * 60 + +time_zone_minute;
                  } else if (time_zone_fourteen_hundred != null) {
                    timezoneOffset = 14 * 60;
                  }

                  if (time_zone_sign === "-") {
                    timezoneOffset = -timezoneOffset;
                  }

                  return dateFromDateTime(1972, 12, day, 0, 0, 0, timezoneOffset);

                case "http://www.w3.org/2001/XMLSchema#gMonth":
                  if ((string = collapse(literal)) == null) {
                    return;
                  }

                  var _string$match17 = string.match(/^--(0[1-9]|1[0-2])(?:Z|(\+|-)(?:(0[0-9]|1[0-3]):([0-5][0-9])|(14:00)))?$/);

                  var _string$match18 = _slicedToArray(_string$match17, 6);

                  match = _string$match18[0];
                  month = _string$match18[1];
                  var _string$match18$ = _string$match18[2];
                  time_zone_sign = _string$match18$ === void 0 ? "+" : _string$match18$;
                  time_zone_hour = _string$match18[3];
                  time_zone_minute = _string$match18[4];
                  time_zone_fourteen_hundred = _string$match18[5];

                  if (!match) {
                    return;
                  }

                  if (time_zone_hour != null && time_zone_minute != null) {
                    timezoneOffset = time_zone_hour * 60 + +time_zone_minute;
                  } else if (time_zone_fourteen_hundred != null) {
                    timezoneOffset = 14 * 60;
                  }

                  if (time_zone_sign === "-") {
                    timezoneOffset = -timezoneOffset;
                  }

                  return dateFromDateTime(1972, month, null, 0, 0, 0, timezoneOffset);

                case "http://www.w3.org/2001/XMLSchema#hexBinary":
                  if ((string = collapse(literal)) == null) {
                    return;
                  }

                  if (!/^(?:[\dA-Fa-f]{2})*$/.test(string)) {
                    return;
                  }

                  if (typeof Uint8Array !== "function") {
                    return hexes;
                  }

                  array = new Uint8Array(string.length / 2);
                  index = 0;

                  while (index < string.length) {
                    array[index] = parseInt(string[index++], 0x10) * 0x10 + parseInt(string[index++], 0x10);
                  }

                  return array.buffer;

                case "http://www.w3.org/2001/XMLSchema#base64Binary":
                  if ((string = collapse(literal)) == null) {
                    return;
                  }

                  if (!/^(?:(?:(?:[A-Za-z0-9+\/]?){4})*(?:(?:[A-Za-z0-9+\/]?){3}[A-Za-z0-9+\/]|(?:[A-Za-z0-9+\/]?){2}[AEIMQUYcgkosw048]?=|[A-Za-z0-9+\/]?[AQgw]?=?=))?$/.test(string)) {
                    return;
                  }

                  if (typeof Uint8Array !== "function") {
                    return string;
                  }

                  string = string.replace(/\x20/g, "");
                  base64Map = {
                    "+": 62,
                    "/": 63
                  };
                  ref10 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

                  for (pos = i = 0, len = ref10.length; i < len; pos = ++i) {
                    char = ref10[pos];
                    base64_map[char] = pos;
                    base64_map[char.toLowerCase()] = pos + 26;
                  }

                  size = string.replace(/=*$/, "").length * 3 / 4 >>> 0;
                  array = new Uint8Array(size);
                  index = 0;

                  while (index < size) {
                    next24Bits = 0;

                    for (offset = j = 0; j <= 3; offset = ++j) {
                      next24Bits += base64_map[string[index + offset]] * Math.pow(64, 3 - offset);
                    }

                    array[index++] = next24Bits / 0x10000 >>> 0;
                    array[index++] = next24Bits / 0x100 % 0x100 >>> 0;
                    array[index++] = next24Bits % 0x100;
                  }

                  return array.buffer;

                case "http://www.w3.org/2001/XMLSchema#anyURI":
                  if ((string = collapse(literal)) == null) {
                    break;
                  }

                  try {
                    uri = new RFC3987(string);
                    return uri.valueOf();
                  } catch (error) {
                    break;
                  }

              }
            }();

            return value != null ? value : literal;
          };
        }()
      }
    })
  });

  _Variable = function Variable(name) {
    var value;
    constructǃ(this, _Variable, "Variable");
    value = name != null ? name.toString() : String(name);
    return _Term.call(this, VARIABLE, value);
  };

  Object.defineProperty(_NamedNode, "prototype", {
    writable: false,
    value: Object.defineProperties(Variableℙ = Object.create(Termℙ), {
      constructor: {
        value: Ø("Variable", Variableℙ)
      }
    })
  });

  _DefaultGraph = function DefaultGraph() {
    constructǃ(this, _DefaultGraph, "DefaultGraph");
    return _Term.call(this, DEFAULT_GRAPH, "");
  };

  Object.defineProperty(_DefaultGraph, "prototype", {
    writable: false,
    value: Object.defineProperties(DefaultGraphℙ = Object.create(Termℙ), {
      constructor: {
        value: Ø("DefaultGraph", DefaultGraphℙ)
      }
    })
  });

  _Quad = function Quad(subject, predicate, object) {
    var graph = arguments.length > 3 && arguments[3] !== undefined ? arguments[3] : null;
    constructǃ(this, _Quad, "Quad");

    if (!(subject instanceof _NamedNode || subject instanceof _BlankNode || subject instanceof _Variable)) {
      throw new TypeError("Invalid subject.");
    }

    if (!(predicate instanceof _NamedNode || predicate instanceof _Variable)) {
      throw new TypeError("Invalid predicate.");
    }

    if (!(object instanceof _NamedNode || object instanceof Literal || object instanceof _BlankNode || object instanceof _Variable)) {
      throw new TypeError("Invalid object.");
    }

    if (!(graph instanceof _DefaultGraph || graph instanceof _NamedNode || graph instanceof _BlankNode || graph instanceof _Variable)) {
      graph = new _DefaultGraph();
    }

    return Object.defineProperties(this, {
      graph: {
        configurable: true,
        enumerable: true,
        writable: false,
        value: graph
      },
      predicate: {
        configurable: true,
        enumerable: true,
        writable: false,
        value: predicate
      },
      object: {
        configurable: true,
        enumerable: true,
        writable: false,
        value: object
      },
      subject: {
        configurable: true,
        enumerable: true,
        writable: false,
        value: subject
      }
    });
  };

  Object.defineProperty(_Quad, "prototype", {
    writable: false,
    value: Object.defineProperties(Quadℙ = {}, {
      constructor: {
        value: Ø("Quad", Quadℙ)
      },
      equals: {
        value: function value(other) {
          if (!(this != null && other != null)) {
            return this == null && other == null;
          }

          if (this instanceof _Quad && other instanceof _Quad) {
            return Termℙ.equals.call(this.subject, other.subject), Termℙ.equals.call(this.predicate, other.predicate), Termℙ.equals.call(this.object, other.object), Termℙ.equals.call(this.graph, other.graph);
          }

          return false;
        }
      }
    })
  });

  Triple = function Triple(subject, predicate, object) {
    constructǃ(this, _Quad, "Quad");

    if (!(subject instanceof _NamedNode || subject instanceof _BlankNode)) {
      throw new TypeError("Invalid subject.");
    }

    if (!(predicate instanceof _NamedNode)) {
      throw new TypeError("Invalid predicate.");
    }

    if (!(object instanceof _NamedNode || object instanceof Literal || object instanceof _BlankNode)) {
      throw new TypeError("Invalid object.");
    }

    return _Quad.call(this, subject, predicate, object);
  };

  Object.defineProperty(Triple, "prototype", {
    writable: false,
    value: Object.defineProperties(Tripleℙ = Object.create(Quadℙ), {
      constructor: {
        value: Ø("Triple", Tripleℙ)
      },
      toString: {
        value: function value() {
          var objectNT, predicateNT, ref1, ref2, ref3, subjectNT;

          if (!(typeof (subjectNT = this != null ? (ref1 = this.subject) != null ? ref1.toNT : void 0 : void 0) === "function" && typeof (predicateNT = this != null ? (ref2 = this.predicate) != null ? ref2.toNT : void 0 : void 0) === "function" && typeof (objectNT = this != null ? (ref3 = this.objectNT) != null ? ref3.toNT : void 0 : void 0) === "function")) {
            return Object.prototype.toString.call(this);
          }

          return "".concat(subjectNT(), " ").concat(predicateNT(), " ").concat(objectNT(), " .");
        }
      }
    })
  });
  nextBlankNode = 0;

  _DataFactory = function DataFactory() {
    return constructǃ(this, _DataFactory, "DataFactory");
  };

  Object.defineProperty(_DataFactory, "prototype", {
    writable: false,
    value: Object.defineProperties(DataFactoryℙ = {}, {
      constructor: {
        value: Ø("DataFactory", DataFactoryℙ)
      },
      namedNode: {
        value: function value(_value) {
          return new _NamedNode(_value);
        }
      },
      blankNode: {
        value: function value(_value2) {
          return new _BlankNode(_value2 != null ? _value2 : "".concat(SIGIL).concat(nextBlankNode++));
        }
      },
      literal: {
        value: function value(_value3, languageOrDatatype) {
          var datatype, lang;

          if (languageOrDatatype instanceof _NamedNode) {
            datatype = languageOrDatatype;
          } else {
            lang = langaugeOrDatatype;
          }

          return new Literal(_value3, lang, datatype);
        }
      },
      variable: {
        value: function value(_value4) {
          return new _Variable(_value4);
        }
      },
      defaultGraph: {
        value: function value() {
          return new _DefaultGraph();
        }
      },
      triple: {
        value: function value() {
          return new Triple(subject, predicate, object);
        }
      },
      quad: {
        value: function value() {
          return new _Quad(subject, predicate, object, graph);
        }
      }
    })
  });
  Object.defineProperties(ｍｅｒｍａｉｄ, {
    create: {
      configurable: true,
      enumerated: true,
      writable: false,
      value: new _DataFactory()
    }
  });
}).call(void 0);
