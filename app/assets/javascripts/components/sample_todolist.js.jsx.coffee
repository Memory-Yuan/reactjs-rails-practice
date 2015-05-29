# todolist sample
$ ->
  TodoBox = React.createClass
    getInitialState: ->
      items: ['hello', 'word']
    handleAdd: (text) ->
      newItems = @state.items.concat(text)
      @setState(items: newItems)
    handleDelete: (index) ->
      newItems = @state.items
      newItems.splice(index, 1)
      @setState(items: newItems)
    render: ->
      `<div>
        <h2>Todo</h2>
        <TodoList items={this.state.items} handleDelete={this.handleDelete} />
        <TodoForm handleAdd={this.handleAdd} />
      </div>`

  TodoList = React.createClass
    handleDelete: (index)->
      @props.handleDelete(index)
    render: ->
      todoItems = @props.items.map (item, index) =>
        React.addons.cloneWithProps(`<TodoItem />`, {handleDelete:@handleDelete, item: item, index: index, key: index})
        # `<TodoItem key={index} item={item} index={index} handleDelete={this.handleDelete} />`

      `<ul className="todoList">{ todoItems }</ul>`

  TodoItem = React.createClass
    handleDelete: ->
      @props.handleDelete(@props.index)
    render: ->
      `<li>{this.props.item}<button onClick={this.handleDelete}>x</button></li>`

  TodoForm = React.createClass
    getInitialState: ->
      text: ''
    handleChange: (e) ->
      @setState(text: e.target.value)
    handleSubmit: (e) ->
      e.preventDefault()
      return if not @state.text?
      @setState(text: '')
      @props.handleAdd(@state.text)
    render: ->
      `<form onSubmit={this.handleSubmit}>
        <input onChange={this.handleChange} value={this.state.text} />
        <button type='submit'>Add</button>
      </form>`

  # React.render(`<TodoBox />`, $('#content')[0])





