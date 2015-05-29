# children sample
$ ->
  Avatar = React.createClass
    render: ->
      `<div>
        <h1>SampleII - children</h1>
        <ProfilePic username={this.props.username} />
        <ProfileLink username={this.props.username} />
        {this.props.children}
      </div>`

  ProfilePic = React.createClass
    render: ->
      `<img src={'http://graph.facebook.com/' + this.props.username + '/picture'} />`

  ProfileLink = React.createClass
    render: ->
      `<a href={'http://www.facebook.com/' + this.props.username}>
        {this.props.username}
      </a>`

  # React.render(
  #   `<Avatar username='MemoryYuan'><ProfileLink username='phw' /></Avatar>`,
  #   $('#content')[0]
  # )

