describe("Todo API", function(){
	it("should define a sort method", function(){
		expect(Todo.API.sort).toBeDefined();
	});
	it("should define a complete method", function(){
		expect(Todo.API.complete).toBeDefined();
	});
});