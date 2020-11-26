ready = ->
    validator = $('#formulario_usuarios').validate
        rules:
            'usuario[rfc]':
                required: true
                minlength: 13
                maxlength: 13
                regexPatern: /^([A-Z,Ñ,&]{3,4}([0-9]{2})(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1])[A-Z|\d]{3})$/
                remote:
                    url: '/validar_rfc'
                    type: 'GET'
                    dataType: 'json'
                    dataFilter: ( txtResponse ) ->
                        resultado = $.parseJSON( txtResponse )
                        if resultado.validar
                            return true
                        else
                            return false

            'usuario[curp]':
                required: true
                minlength: 18
                maxlength: 18
                regexPatern: /^([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)$/
            'usuario[nombre]':
                required: true
                maxlength: 50
            'usuario[paterno]':
                required: true
                maxlength: 50
            'usuario[materno]':
                required: true
                maxlength: 50
            'usuario[telefono]':
                number: true
                maxlength: 10
                minlength: 10
            'usuario[correo]':
                required: true
                email: true
                maxlength: 50
            'usuario[login]':
                required: true
                maxlength: 50
            'usuario[password]':
                required: true
                maxlength: 50
            'usuario[estado_id]':
                required: true
        messages:
            'usuario[rfc]':
                required: 'Este campo es requerido'
                minlength: 'Minimo de caracteres es 13'
                maxlength: 'Maximo de caracteres es 13'
                regexPatern: 'El formato del RFC es incorrecto'
                remote: 'EL RFC ya esta registrado'
            'usuario[curp]':
                required: 'Este campo es requerido'
                minlength: 'Minimo de caracteres es 18'
                maxlength: 'Maximo de caracteres es 18'
                regexPatern: 'El formato del CURP es incorrecto'
            'usuario[nombre]':
                required: 'Este campo es requerido'
                maxlength: 'Maximo de caracteres es 50'
            'usuario[paterno]':
                required: 'Este campo es requerido'
                maxlength: 'Maximo de caracteres es 50'
            'usuario[materno]':
                required: 'Este campo es requerido'
                maxlength: 'Maximo de caracteres es 50'
            'usuario[telefono]':
                number: 'Esta campo solo acepta numeros'
                maxlength: 'Longitud Maxima es de 10'
                minlength: 'Longitud Minima es de 10'
            'usuario[correo]':
                required: 'Este campo es requerido'
                email: 'Ingese un correo valido'
                maxlength: 'La longitud maxima es 50'
            'usuario[login]':
                required: 'Este campo es requerido'
                maxlength: 'La longitud maxima de este campo es 50'
            'usuario[password]':
                required: 'Este campo es requerido'
                maxlength: 'La longitud maxima de este campo es de 50'
            'usuario[estado_id]':
                required: 'Debe seleccionar uno'


    $.validator.addMethod("regexPatern",(value, element,regexPatern)->
        return this.optional( element ) || regexPatern.test( value.toUpperCase())
    )
#$.validator.addMethod("rfc_check",function(value, element){
#  return this.optional( element ) || /^([A-ZÑ\x26]{3,4}([0-9]{2})(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1]))([A-Z\d]{3})?$/.test( value );
#},"El formato del RFC es Erroneo");
#
#$.validator.addMethod("curp_check",function(value, element){
#  return this.optional( element ) || /^([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)$/.test( value );
#},"El Formateo del CURP no es valido");
$(document).ready(ready)
$(document).on('turbolinks:load', ready)
