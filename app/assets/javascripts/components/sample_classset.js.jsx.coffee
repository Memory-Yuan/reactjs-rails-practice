# ClassSet sample
$ ->
	WithoutClassSet = React.createClass
		render: ->
			classString = 'message'
			classString += ' message-important' if @props.isImportant
			classString += ' message-read' if @props.isRead
			`<div className={classString}>Great, I'll be there</div>`

	WithClassSet = React.createClass
		render: ->
			cx = React.addons.classSet
			classes = cx(
				'message': true,
				'message-important': @props.isImportant,
				'message-read': @props.isRead
			)
			`<div className={classes}>Great, I'll be there</div>`
	# React.render(`<WithoutClassSet isRead='1' isImportant='1' />`, $('#content')[0])
	# React.render(`<WithClassSet isRead='1' isImportant='1' />`, $('#content')[0])
