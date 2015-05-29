# React只會更新需要更新的部分，所以input不會跟著刷新
$ ->
	HelloWorld = React.createClass
  	render: ->
	    `<p>
	      Hello, <input type="text" placeholder="Your name here" />!
	      It is {this.props.date.toTimeString()}
	    </p>`

	# setInterval(
	#   ->
	#     React.render(
	#       `<HelloWorld date={new Date()} />`,
	#       $('#content')[0]
	#     )
	#   , 500
	# )

