class MyController
  def hello
    { message: "Olá do Controller!" }
  end

  def info
    { app: "MyApp", version: "1.0.0" }
  end
end