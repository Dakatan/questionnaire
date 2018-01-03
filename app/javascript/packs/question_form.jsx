import React from "react"
import PropTypes from "prop-types"
import ReactDOM from 'react-dom'

class QuestionForm extends React.Component {
  render() {
    return (
      <div>
          <input className="form-control" type="text" name="TTT" value={this.props.questionValue} />
      </div>
    )
  }
}

QuestionForm.defaultProps = {
  questionValue: ""
};

QuestionForm.propTypes = {
  questionValue: PropTypes.string
};

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <QuestionForm />,
    document.getElementById('question-form')
  )
});
