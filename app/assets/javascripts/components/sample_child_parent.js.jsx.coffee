$ ->
	SampleChild = React.createClass
		handleClick: ->
			@props.onClick(this)
		render: ->
			`<button onClick={this.handleClick} ref="myButton" type="button"> Click Me </button>`


	SampleParent = React.createClass
		handleClick: (childComponent) ->
			alert('The Child button text is: "' + childComponent.refs.myButton.getDOMNode().innerText + '"')
		render: ->
			`<SampleChild onClick={this.handleClick} />`
		
	# React.render(`<SampleParent />`, $('#content')[0])