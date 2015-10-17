form.form-horizontal submit="save"
  .form-group
    |{{#each model.errors.name as |error|}}
    |  <div class="error">
    |    {{error.message}}
    |  </div>
    |{{/each}}
  .form-group
    label Тема
    = input value=model.subject_template class="form-control"
  .form-group
    label Тип
    = input value=model.kind class="form-control"
  .form-group
    label Сообщение
    textarea value=model.body_template class="form-control"

  .form-group
    button.btn.btn-primary type="submit" Сохранить