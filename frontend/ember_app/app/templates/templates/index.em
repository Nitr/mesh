h1 Шаблоны
table.table.table-striped
  thead
    tr
      th Название
  tbody
    = each model as |template|
      tr
        td= template.name