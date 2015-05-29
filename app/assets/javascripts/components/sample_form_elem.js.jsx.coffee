# 各種Form元件sample
$ ->
	TestFormEle = React.createClass
		render: ->
			`<div>
				<TestInput />
				<TestTextarea />
				<TestSelect />
			</div>`

	TestInput = React.createClass
	  getInitialState: ->
	  	value: 'Hello!'
	  handleChange: (event) ->
	    @setState(value: event.target.value)
	  render: ->
	    `<ul>
	    	<li><input type='text' defaultValue="Hello!" placeholder='hello hello' /></li>
	    	<li><input type='text' value="I can't be changed!" /></li>
	    	<li><input type='text' value={this.state.value} onChange={this.handleChange} /></li>
	    </ul>`

	TestTextarea = React.createClass
		getInitialState: ->
			value: 'Hello! Hello! \n YAYA'
		handleChange: (event) ->
			@setState(value: enent.target.value)
		render: ->
			`<textarea value={this.state.value} onChange={this.handleChange} />`

	TestSelect = React.createClass
		getInitialState: ->
			selected: 'A'
			selectData: [{value: 'A', text:'Apple'}, {value: 'B', text:'Banana'},{value: 'C', text:'Cranberry'}]
		handleChange: (event) ->
			@setState(selected: event.target.value)
		render: ->
			options = @state.selectData.map (data) ->
				`<option value={data.value}>{data.text}</option>`
			`<select value={this.state.selected} onChange={this.handleChange}>
				{options}
			</select>`

	# React.render(`<TestFormEle />`, $('#content')[0]);