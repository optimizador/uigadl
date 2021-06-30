require 'sinatra'
require 'rest-client'

set(:cookie_options) do
  { :expires => Time.now + 30*60 }
end

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
get '/regresar' do
  redirect "https://ui.9sxuen7c9q9.us-south.codeengine.appdomain.cloud/"
  #redirect "http://localhost:4567"
end
get '/uigarespuesta' do
  logger = Logger.new(STDOUT)
  logger.info("Recibiendo parametros para dimensionamiento de CP4D: CPU: #{params[:cpu]} RAM: #{params[:ram]} Storage: #{params[:storage]} IOPS #{params[:iops]}")
  @name = "GatewayAppliance Dimensionamiento"
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
  erb :uiga , :locals => {:respuestasizing => respuestasizing}
end
