ready = ->
    validator = $('#formulario_paises').validate
        rules:
            'pais[nombre]':
                required: true
                maxlength: 50
            'pais[descripcion]':
                required: true
                maxlength: 50
        messages:
            'pais[nombre]':
                required: 'El campo es requerido'
                maxlength: 'Longitd maximaa del campo es de 50'
            'pais[descripcion]':
                required: 'El campo es requerido'
                maxlength: 'Longitud maximma del campo es de 50'

$(document).ready(ready)
$(document).on('turbolinks:load', ready)
