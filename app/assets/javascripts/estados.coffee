# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
    validator = $('#formulario_estados').validate
        rules:
            'estado[nombre]':
                required: true
                maxlength: 50
            'estado[descripcion]':
                required: true
                maxlength: 50
            'estado[pais_id]':
                required: true
        messages:
            'estado[nombre]':
                required: 'El campo es requerido'
                maxlength: 'Longitd maximaa del campo es de 50'
            'estado[descripcion]':
                required: 'El campo es requerido'
                maxlength: 'Longitud maximma del campo es de 50'
            'estado[pais_id]':
                required: 'Debes seleccionar uno'

$(document).ready(ready)
$(document).on('turbolinks:load', ready)

