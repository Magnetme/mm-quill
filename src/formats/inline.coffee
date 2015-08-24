Parchment = require('parchment')


class Bold extends Parchment.Inline
  @blotName: 'bold'
  @tagName: 'STRONG'

class Italic extends Parchment.Inline
  @blotName: 'italic'
  @tagName: 'EM'

class Strike extends Parchment.Inline
  @blotName: 'strike'
  @tagName: 'S'

class Underline extends Parchment.Inline
  @blotName: 'underline'
  @tagName: 'U'

class Link extends Parchment.Inline
  @blotName: 'link'
  @tagName: 'A'

  constructor: (value) ->
    super(value)
    @domNode.href = value

  getFormat: ->
    format = super()
    format.link = this.domNode.href
    return format

class InlineCode extends Parchment.Inline
  @blotName: 'inline-code'
  @tagName: 'code'


# TODO: implement exclusitivity

class Script extends Parchment.Inline
  @blotName: 'script'
  @tagName: ['sub', 'sup']

  constructor: (value) ->
    if (typeof value == 'string')
      value = document.createElement(value)
    super(value)

  getFormat: ->
    formats = super
    formats['script'] = @domNode.tagName.toLowerCase()
    return formats


Background = new Parchment.Style('background', 'backgroundColor')
Color = new Parchment.Style('color', 'color')
Font = new Parchment.Style('font', 'fontFamily')
Size = new Parchment.Style('size', 'fontSize')


module.exports =
  Bold        : Parchment.define(Bold)
  Italic      : Parchment.define(Italic)
  Strike      : Parchment.define(Strike)
  Underline   : Parchment.define(Underline)

  Link        : Parchment.define(Link)
  InlineCode  : Parchment.define(InlineCode)
  Script      : Parchment.define(Script)

  Background  : Parchment.define(Background)
  Color       : Parchment.define(Color)
  Font        : Parchment.define(Font)
  Size        : Parchment.define(Size)