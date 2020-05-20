Rails.application.routes.draw do
  get 'medicos_registrar_servicio/MedicosRegistrarServicio'
  get 'pacientes_menu/PacientesMenu'
  
  get 'medicos_menu/MedicosMenu'

  get 'registro_pacientes/RegistroPacientes'
  post 'registro_pacientes/RegistroPacientes'

  get 'registro_medicos/RegistroMedicos'
  post 'registro_medicos/RegistroMedicos'

  get 'registro_medicos/new'
  get 'registro_medicos/create'

  resources :states, only: :index
  resources :cities, only: :index

  devise_for :patients, path: 'patients', controllers: {
    sessions: "patients/sessions",
    passwords: "patients/passwords",
    registrations: "patients/registrations" }

  devise_for :doctors, path: 'doctors', controllers: {
    sessions: "doctors/sessions",
    passwords: "doctors/passwords",
    registrations: "doctors/registrations" }

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
