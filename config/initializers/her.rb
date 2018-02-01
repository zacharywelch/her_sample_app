Her::API.setup url: "https://api.example.com" do |c|
  c.use Faraday::Request::UrlEncoded
  c.use Her::Middleware::DefaultParseJSON
  c.adapter :test do |stub|
    stub.get("/users") { [200, {}, [{ id: 1, name: "Tobias Fünke" }, { id: 2, name: "Lindsay Fünke" }].to_json] }
    stub.get("/users/1") { [200, {}, { id: 1, name: "Tobias Fünke" }.to_json] }
    stub.get("/users/2") { [200, {}, { id: 2, name: "Lindsay Fünke" }.to_json] }
    stub.post("/users") { [200, {}, { id: 3, name: "Foo" }.to_json] }
    stub.get("/users/3") { [200, {}, { id: 3, name: "Foo" }.to_json] }

    stub.get("/comments") { [200, {}, [{ id: 1, content: "They're having a FIRESALE?" }].to_json] }
    stub.get("/comments/1") { [200, {}, { id: 1, content: "They're having a FIRESALE?" }.to_json] }
    stub.post("/comments") { [200, {}, { id: 2, content: "Awesome" }.to_json] }
    stub.get("/comments/2") { [200, {}, { id: 2, content: "Awesome" }.to_json] }
  end
end
