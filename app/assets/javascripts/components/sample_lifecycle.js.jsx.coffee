# life cycle sample
$ ->
  TestLife = React.createClass
    getInitialState: ->
      console.log("> getInitialState()")
      user: 'AndyYou'
    
    componentWillMount: ->
      console.log("> componentWillMount()")
    
    componentDidMount: (node) ->
      console.log("> componentDidMount(node)")
      console.log(node.className)
      console.log(node.value)
      console.log(node.id)
      console.log(this.getDOMNode().className)
      console.log(this.getDOMNode().value)
      console.log(this.getDOMNode().id)
    
    componentWillReceiveProps: (nextProps) ->
      console.log("> componentWillReceiveProps(nextProps)")
      console.log(nextProps)
    
    handleChange: (e) ->
      console.log(e.target.value)
      @setState(user: e.target.value)
    
    shouldComponentUpdate: (nextProps, nextState) ->
      console.log("> shouldComponentUpdate(nextProps, nextState)")
      console.log("nextProps: ")
      console.log(nextProps)
      console.log("nextState: ")
      console.log(nextState)
      true
    componentWillUpdate: (nextProps, nextState) ->
      console.log("> componentWillUpdate(nextProps, nextState)")
    
    componentWillUnmount: ->
      console.log("> componentWillUnmount()")
    render: ->
      `<input type='text' id='foobar' value={this.state.user} className='nav' onChange={this.handleChange} />`
  # testLife = React.render(`<TestLife title='Untitled' />`, $('#content')[0])
  # test.setProps({title: 'No'})
  # React.unmountComponentAtNode(document.getElementById('example'))
  # test.setState({user:'Calvert'})
