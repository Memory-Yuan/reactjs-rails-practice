# # tab sample
# # ref, cloneWithProps, comminity with component
# $ ->
# 	Tab = React.createClass
# 		getInitialState: ->
# 			selected: false
# 		handleSelected: (status) ->
# 			@setState(selected: status)
# 		render: ->
# 			cx = React.addons.classSet
# 			classes = cx(
# 				'react-tab': true,
# 				'active': @state.selected
# 			)
# 			`<li className={classes}>
# 				<a href='#' data-index={this.props.index}>{this.props.children}</a>
# 			</li>`
    
# 	TabList = React.createClass
# 		render: ->
# 			`<ul className='react-tab-list'>
# 				{this.props.children}
# 			</ul>`

# 	TabPanel = React.createClass
# 		getInitialState: ->
# 			selected: false
# 		handleSelected: (status) ->
# 			console.log(@props.name + ' selected: ' + status)
# 			@setState(selected: status)
# 		render: ->
# 			cx = React.addons.classSet
# 			classes = cx(
# 				'react-tab-panel': true,
# 				'active': @state.selected
# 			)
# 			`<div className={classes}>
# 				{this.props.children}
# 			</div>`

# 	TabBox = React.createClass
# 		getInitialState: ->
# 			selectedIndex: 0
# 		componentDidMount: ->
# 			tabs = @props.children[0].props.children
# 			panels = @props.children.slice(1)
# 			index = @state.selectedIndex
# 			for i in tabs
# 				if i == index
# 					tabs[i].handleSelected(true)
# 					panels[i].handleSelected(true)
# 				else
# 					tabs[i].handleSelected(false)
# 					panels[i].handleSelected(false)
# 		handleClick: (e) ->
# 			index = parseInt(e.target.getAttribute('data-index'))
# 			index = index ? index:0
# 			tabs = this.props.children[0].props.children,
# 			panels = this.props.children.slice(1)
# 			for i in tabs
# 				if i == index
# 					tabs[i].handleSelected(true)
# 					panels[i].handleSelected(true)
# 				else
# 					tabs[i].handleSelected(false)
# 					panels[i].handleSelected(false)
# 		render: ->
# 			`<div className='react-tabs' onClick={this.handleClick}>
# 				{this.props.children}
# 			</div>`

# 	App = React.createClass
# 		render: ->
# 			`<div className='container'>
# 				<TabBox>
# 					<TabList>
# 						<Tab name='ironman' index={0}>Iron man</Tab>
# 						<Tab name='superman' index={1}>Superman</Tab>
# 						<Tab name='lucy' index={2}>Lucy</Tab>
# 					</TabList>

# 					<TabPanel name='panel-ironman'>
# 						鋼鐵人
# 					</TabPanel>

# 					<TabPanel name='panel-superman'>
# 						超人再起
# 					</TabPanel>

# 					<TabPanel name='panel-lucy'>
# 						露西
# 					</TabPanel>
# 				</TabBox>
# 			</div>`

# 	React.render(`<App />`, $('#content')[0])