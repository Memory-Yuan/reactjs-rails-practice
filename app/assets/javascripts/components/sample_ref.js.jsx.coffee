# ref sample
$ ->
	TestRef = React.createClass
		getInitialState: ->
			userInput: ''
		handleChenge: (event) ->
			@setState(userInput: @getDOMNode().value)
			console.log(event)
			#event.target.value
		resetAndFocusInput: ->
			@setState(userInput: '')
			@refs.myTextInput.getDOMNode().focus()
		render: ->
			`<div>
				<input type="text" value={this.state.userInput} onChange={this.handleChenge} ref="myTextInput" />
				<button type="button" onClick={this.resetAndFocusInput}>Click To Reset and Focus</button>
			</div>`

	# React.render(`<TestRef />`,$('#content')[0])
