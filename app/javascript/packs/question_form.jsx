import React from "react"
import PropTypes from "prop-types"
import ReactDOM from 'react-dom'

class QuestionForm extends React.Component {
  render() {
    return (
      <div>This is a sample!</div>
    )
  }
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <QuestionForm name="React" />,
    document.getElementById('question-form')
  )
});
