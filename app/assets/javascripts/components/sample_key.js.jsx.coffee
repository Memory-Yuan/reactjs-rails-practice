# React 調和(重新調整)這些帶有 key 的子元件時，
# 這可以確保任何有 key 的元件都將被重新載入(而不是被破壞)或破壞(而不是重複使用)。
$ ->
	data = [{id: 1, text:'A'}, {id:2, text:'B'}]
	List = React.createClass
  render: ->
    results = @props.results.map (result) ->
    	`<li><input type='text' key={result.id}/></li>`

    `<div>
    	<h3>I will be killed after 5 seconds</h3>
	    <ol>
	      {results}
	    </ol>
    </div>`
   
	# React.render(`<List results={data} />`, $('#content')[0])

	# setInterval(
	# 	->
	# 		data.map (elem) ->
	# 			elem.id +=2
	#   	React.render(`<List results={data} />`, $('#content')[0])
	# 	, 5000
	# )
