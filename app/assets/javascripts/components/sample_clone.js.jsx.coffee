$ ->
  RadioOption = React.createClass
    render: ->   
      `<label>
        <input type="radio" value={this.props.value} name={this.props.name} />
        {this.props.label}
      </label>`

  RadioGroup = React.createClass
    renderChildren: ->
      React.Children.map @props.children, (child, index) =>
        if child.type is RadioOption.type
          React.addons.cloneWithProps(child, {name: @props.name, key: index})
        else
          child

    render: ->
      `<div className="radio-group">
        {this.renderChildren()}
      </div>`

  WhereImUsingRadioGroups = React.createClass
    render: ->
      `<RadioGroup name="blizzard-games">
        <RadioOption label="Warcraft 2" value="wc2" />
        <RadioOption label="Warcraft 3" value="wc3" />
        <RadioOption label="Starcraft 1" value="sc1" />
        <RadioOption label="Starcraft 2" value="sc2" />
      </RadioGroup>`

  # React.render(`<WhereImUsingRadioGroups />`, $('#content')[0])