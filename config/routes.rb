Rails.application.routes.draw do
  root "pages#home"
  resources :librarians
  get 'librarian/login', to: 'librarians/sessions#new'
  post 'librarian/login', to: 'librarians/sessions#create'
  get 'librarian/logout', to: 'librarians/sessions#destroy'
  resources :books
  get 'member/login', to: 'members/sessions#new'
  post 'member/login', to: 'members/sessions#create'
  get 'member/logout', to: 'members/sessions#destroy'
  resources :members, except: [:destroy]
  get 'book/borrow:id',to: 'books#borrow',as: 'borrow'
end
