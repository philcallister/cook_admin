defmodule CookAdminWeb.Router do
  use CookAdminWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CookAdminWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/authors", AuthorController
    resources "/recipes", RecipeController do
      resources "/ingredient_sections", IngredientSectionController, except: [:index]
      resources "/instruction_sections", InstructionSectionController, except: [:index]
    end
  end
  
  # Other scopes may use custom stacks.
  # scope "/api", CookAdminWeb do
  #   pipe_through :api
  # end
end
