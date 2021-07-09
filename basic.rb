require 'sinatra'
require 'rest-client'

set(:cookie_options) do
  { :expires => Time.now + 30*60 }
end


#************
#Copiar y actualizar en cada módulo
# ***Adaptar para que no se reescriban las rutas del módulo en particular donde se despliegue
#************
get '/cp4d' do
  redirect "https://ui.9sxuen7c9q9.us-south.codeengine.appdomain.cloud/cp4d"
  #redirect "http://localhost:8090"
end

get '/' do
  logger = Logger.new(STDOUT)
  logger.info(request)
  #@name = "Pedro"
  response.set_cookie("llave", value: "valor")
  erb :index

end
#get '/uiga' do
#  redirect "https://ui-ga.9sxuen7c9q9.us-south.codeengine.appdomain.cloud/uiga"
  #redirect "http://localhost:8090"
#end
get '/loganalysis' do
  redirect "https://ui-monitoring.9sxuen7c9q9.us-south.codeengine.appdomain.cloud/VATLA?"
  #redirect "http://localhost:8090"
end

get '/monitoring' do
  redirect "https://ui-monitoring.9sxuen7c9q9.us-south.codeengine.appdomain.cloud/VLG?"
  #redirect "http://localhost:8090"
end

get '/pxbackup' do
  redirect "https://pxbackup.9sxuen7c9q9.us-south.codeengine.appdomain.cloud/"
  #redirect "http://localhost:8090"
end
get '/iks' do
  redirect "https://iks-ocp.9sxuen7c9q9.us-south.codeengine.appdomain.cloud/iks"
end
get '/ocp' do
  redirect "https://iks-ocp.9sxuen7c9q9.us-south.codeengine.appdomain.cloud/ocp"
end
get '/cr' do
  redirect "https://ui-cr.9sxuen7c9q9.us-south.codeengine.appdomain.cloud/"
end
#************
#Fin Copiar y actualizar en cada módulo
#************


get '/regresar' do
  redirect "https://ui.9sxuen7c9q9.us-south.codeengine.appdomain.cloud/"
  #redirect "http://localhost:4567"
end
get '/' do
  'UI Comunicaciones: Gateway Appliance/Enlaces Dedicados/Calculadoras'
end

get '/uicalc' do
  logger = Logger.new(STDOUT)
  logger.info("Selecciono calculadora para transferencia de datos")
  @name = "CalculadoraTransferencia"
  respuestasizing=[]
  respuestasizingalt=[]
  respuestastorage=[]
    erb :uicalc , :locals => {:respuestasizing => respuestasizing,:respuestasizingalt => respuestasizingalt, :respuestastorage => respuestastorage}
end
get '/uicalcrespuesta' do
  logger = Logger.new(STDOUT)
  logger.info("Recibiendo parametros para calculadora: CPU: #{params[:cpu]} RAM: #{params[:ram]} Storage: #{params[:storage]} IOPS #{params[:iops]}")
  @name = "Respuesta Calculadora"
  #urlapi="https://apis.9sxuen7c9q9.us-south.codeengine.appdomain.cloud"
  urlapi="http://localhost:8080"
  region="#{params['region']}"
  type="#{params['type']}"
  interfase="#{params['interfase']}"
  pii="#{params['pii']}"
  ha="#{params['ha']}"
  #parametros recibidos
  respuestasizing = RestClient.get "#{urlapi}/api/v1/sizingga?region=#{region}&type=#{type}&interfase=#{interfase}&ha=#{ha}&pii=#{pii}", {:params => {}}
  respuestasizing=JSON.parse(respuestasizing.to_s)
  logger.info(respuestasizing)
  #erb :cp4d , :locals => {:respuestasizing => params[:respuestasizing]}
  erb :uicalc , :locals => {:respuestasizing => respuestasizing}
end


get '/uiga' do
  logger = Logger.new(STDOUT)
  logger.info("Selecciono dimensionamiento para Gateway Appliance")
  @name = "GatewayAppliance"
  respuestasizing=[]
  respuestasizingalt=[]
  respuestastorage=[]
    erb :uiga , :locals => {:respuestasizing => respuestasizing,:respuestasizingalt => respuestasizingalt, :respuestastorage => respuestastorage}
end
get '/uigarespuesta' do
  logger = Logger.new(STDOUT)
  logger.info("Recibiendo parametros para dimensionamiento de CP4D: CPU: #{params[:cpu]} RAM: #{params[:ram]} Storage: #{params[:storage]} IOPS #{params[:iops]}")
  @name = "GatewayAppliance Dimensionamiento"
  urlapi="https://apis-ga.9sxuen7c9q9.us-south.codeengine.appdomain.cloud/"
  #urlapi="http://localhost:8080"
  region="#{params['region']}"
  type="#{params['type']}"
  interfase="#{params['interfase']}"
  pii="#{params['pii']}"
  ha="#{params['ha']}"
  #parametros recibidos
  respuestasizing = RestClient.get "#{urlapi}/api/v1/sizingga?region=#{region}&type=#{type}&interfase=#{interfase}&ha=#{ha}&pii=#{pii}", {:params => {}}
  respuestasizing=JSON.parse(respuestasizing.to_s)
  logger.info(respuestasizing)
  #erb :cp4d , :locals => {:respuestasizing => params[:respuestasizing]}
  erb :uiga , :locals => {:respuestasizing => respuestasizing}
end
