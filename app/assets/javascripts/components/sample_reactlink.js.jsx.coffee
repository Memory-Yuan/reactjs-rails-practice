# Two-Way Binding Helpers sample
# ReactLink is just a thin wrapper and convention around the onChange/setState() pattern.
# It doesn't fundamentally change how data flows in your React application.
$ ->
	NoLink = React.createClass
	  getInitialState: ->
	    message: 'Hello!'
	  handleChange: (event) ->
	    @setState(message: event.target.value)
	  render: ->
	    `<input type='text' value={this.state.message} onChange={this.handleChange} />`
	
	WithLink = React.createClass
	# 載入 React.addons.LinkedStateMixin 中的方法 (this.linkState)
		mixins: [React.addons.LinkedStateMixin]
		getInitialState: ->
			message: 'Hello!'
		# For checkboxes, you should use checkedLink instead of valueLink 
		render: ->
			`<div>
				<input type='text' valueLink={this.linkState('message')} />
				<input type="checkbox" checkedLink={this.linkState('booleanValue')} />
			</div>`
	# React.render(`<NoLink />`, $('#content')[0])			
	# React.render(`<WithLink />`, $('#content')[0])
