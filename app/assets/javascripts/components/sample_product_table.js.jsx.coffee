$ ->
  ProductCategoryRow = React.createClass
    render: ->
      `<tr><th colSpan="2">{this.props.category}</th></tr>`

  ProductRow = React.createClass
    render: ->
      classes = React.addons.classSet
        'color-red': !@props.product.stocked

      `<tr>
        <td>
          <span className={classes}>
            {this.props.product.name}
          </span>
        </td>
        <td>{this.props.product.price}</td>
      </tr>`

  ProductTable = React.createClass
    render: ->
      rows = []
      lastCategory = null
      @props.products.forEach (product) =>
        return if product.name.indexOf(@props.filterText) is -1 or (!product.stocked && @props.inStockOnly)
        if product.category isnt lastCategory
          rows.push(`<ProductCategoryRow category={product.category} key={product.category} />`)
        rows.push(`<ProductRow product={product} key={product.name} />`)
        lastCategory = product.category

      `<table>
        <thead>
          <tr>
            <th>Name</th>
            <th>Price</th>
          </tr>
        </thead>
        <tbody>{rows}</tbody>
      </table>`

  SearchBar = React.createClass
    handleChange: ->
      @props.onUserInput(
        @refs.filterTextInput.getDOMNode().value,
        @refs.inStockOnlyInput.getDOMNode().checked
      )

    render: ->
      `<form>
        <input
        type="text"
        placeholder="Search..."
        value={this.props.filterText}
        ref="filterTextInput"
        onChange={this.handleChange}
        />
        <p>
          <input
          type="checkbox"
          checked={this.props.inStockOnly}
          ref="inStockOnlyInput"
          onChange={this.handleChange}
          />
          {' '}
          Only show products in stock
        </p>
      </form>`

  FilterableProductTable = React.createClass
    getInitialState: ->
      filterText: '',
      inStockOnly: false
    handleUserInput: (filterText, inStockOnly) ->
      @setState(filterText: filterText, inStockOnly: inStockOnly)
    render: ->
      `<div>
        <SearchBar
        filterText={this.state.filterText}
        inStockOnly={this.state.inStockOnly}
        onUserInput={this.handleUserInput}
        />
        <ProductTable
        products={this.props.products}
        filterText={this.state.filterText}
        inStockOnly={this.state.inStockOnly}
        />
      </div>`

  PRODUCTS = [
    {category: 'Sporting Goods', price: '$49.99', stocked: true, name: 'Football'},
    {category: 'Sporting Goods', price: '$9.99', stocked: true, name: 'Baseball'},
    {category: 'Sporting Goods', price: '$29.99', stocked: false, name: 'Basketball'},
    {category: 'Electronics', price: '$99.99', stocked: true, name: 'iPod Touch'},
    {category: 'Electronics', price: '$399.99', stocked: false, name: 'iPhone 5'},
    {category: 'Electronics', price: '$199.99', stocked: true, name: 'Nexus 7'}
  ]

  # React.render(`<FilterableProductTable products={PRODUCTS} />`, $('#content')[0])
