import DS from 'ember-data';

export default DS.Model.extend({
  body_template: DS.attr('string'),
  subject_template: DS.attr('string'),
  kind: DS.attr('string')
});
