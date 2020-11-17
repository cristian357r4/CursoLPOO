class PaisesController < ApplicationController
  def inicio
    @paises = Pais.all
  end

  def mostrar
    @pais = Pais.find(params[:id])
  end

  def nuevo
    @pais = Pais.new
  end

  def crear
    @pais = Pais.new(nombre: params[:pais][:nombre], descripcion: params[:pais][:descripcion])
    respond_to do |format|
      if @pais.save
        format.html { redirect_to paises_inicio_path, notice: 'Paise Creado Exitosamente!!' }
      end
    end
  end

  def editar
    @pais = Pais.find(params[:id])
  end

  def actualizar
    @pais = Pais.find(params[:id])
    respond_to do |format|
      if @pais.update(params.require(:pais).permit(:nombre, :descripcion))
        format.html {redirect_to mostrar_pais_path(@pais.id), notice: 'Pais creado correctamente' }
      end
    end
  end

  def eliminar
    @pais = Pais.find(params[:id])
    respond_to do |format|
      if @pais.destroy
        format.html { redirect_to paises_inicio_path, notice: 'Pais fue eliminado Correctamente' }
      end
    end
  end

end
