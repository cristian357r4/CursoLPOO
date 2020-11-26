class EstadosController < ApplicationController
  def inicio
    @estados = Estado.all
  end

  def mostrar
    @estado = Estado.find(params[:id])#sselect * from estados where estaaado idd = 1
    @paises = Pais.all
  end

  def nuevo
    @estado = Estado.new
    @paises = Pais.all
  end

  def crear
    @paises = Pais.all
    @estado = Estado.new(nombre: params[:estado][:nombre], descripcion: params[:estado][:descripcion],pais_id: params[:estado][:pais_id])
    respond_to do |format|
      if @estado.save
        format.html { redirect_to estados_inicio_path, notice: 'Estado Creado Exitosamente!!' }
      end
    end
  end

  def editar
    @estado = Estado.find(params[:id])
    @paises = Pais.all
  end

  def actualizar
    @estado = Estado.find(params[:id])
    respond_to do |format|
      if @estado.update(params.require(:estado).permit(:nombre, :descripcion, :pais_id))
        format.html { redirect_to mostrar_estado_path(@estado.id), notice: 'Estado Modificado Correctamente'  }
      end
    end

  end

  def eliminar
    @estado = Estado.find(params[:id])
    respond_to do |format|
      if @estado.destroy
        format.html { redirect_to estados_inicio_path, notice: 'Estado fue eliminado Correctamente' }
      end
    end
  end
end
