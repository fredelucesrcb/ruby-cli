require 'thor'
require 'net/http'
require 'uri'
require 'json'

class UsersApp < Thor

    desc "hello NAME", "echoes Hello World"
    def hello(name)
        p "Hello World"
    end

    desc 'findSubstr substr', 'Finds Users with the substr in name'  
    def findSubstr(name, case_sensitive='false')

        case_sensitive = is_boolean(case_sensitive)

        raise TypeError, "Second arg must be a boolean" if ![true, false].include? case_sensitive

        subs = !case_sensitive ? name.downcase : name
        users = [] 

        pageContent = fetchData

        pageContent.map do |content|
            users << content if (case_sensitive ? (content["full_name"].include? subs) : (content["full_name"].downcase.include? subs))
        end

        p users
    end

    desc 'duplicates', 'Finds users with same email addresses'
    def duplicates

        emails = []
        dups = []

        pageContent = fetchData

        emails << pageContent.map { |content| content['email'] }
            
        duplicate_emails = emails[0].group_by(&:itself).select { |k, v| v.size > 1 }.keys

        duplicate_emails.map { |email| pageContent.map { |content| dups << content if content['email'] === email } }

        p dups

    end

    private

    def fetchData
        JSON.parse(Net::HTTP.get(URI.parse('https://appassets02.shiftcare.com/manual/clients.json')))
    end

    def is_boolean(str)
        if str.to_s == 'true'
            true
        elsif str.to_s == 'false'
            false
        else
            nil
        end
    end

end

UsersApp.start(ARGV)

