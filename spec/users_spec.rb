require "./users.rb"

describe UsersApp do
  context "testing the findSubstr method" do
    let(:name) { "John" }

    it "The findSubstr method should require a name variable" do
      expect{ (UsersApp.new.invoke(:findSubstr, [])) }.to raise_error(Thor::InvocationError)
    end
    
    it "The findSubstr method should not have more than two arguments" do
      expect{ (UsersApp.new.invoke(:findSubstr, [name, false, 'KEKL'])) }.to raise_error(Thor::InvocationError)
    end

    it "the second argument to findSubstr method should be a boolean" do
      expect{ (UsersApp.new.invoke(:findSubstr, [name, 'KEKL'])) }.to raise_error(TypeError)
    end

    it "The findSubstr method should be empty if the case_sensitive flag is true even if the substring technically exists" do
      result = UsersApp.new.invoke(:findSubstr, [name.upcase, true])
      expect(result).to be_empty
    end

    it "the findSubstr method should return all records where the substr 'John' is in the record's name object" do
      result = UsersApp.new.invoke(:findSubstr, [name])

      result.each do|content|
        expect(content['full_name'].downcase).to include(name.downcase)
      end
    end

    it "the findSubstr method should return an empty array if there are no matches" do

      result = UsersApp.new.invoke(:findSubstr, ["random_name"])

      expect(result).to be_empty
    end
  end

  context "testing the duplicates method" do
    it "The duplicates method should not accept any parameters" do 
      expect{ (UsersApp.new.invoke(:duplicates, ['s'])) }.to raise_error(Thor::InvocationError)
    end

    it "The duplicates method returns the objects which have the same email address" do 
      result = UsersApp.new.invoke(:duplicates, [])
      result1 = result[0]['email']

      result.each do|content|
        expect(content['email']).to eq(result1)
      end
    end
  end
end