require "./config/database"
require "sam"
require "./db/migrations/*"
require "./src/models/*"

load_dependencies "jennifer"

namespace "db" do
  task "seed" do
    Contact.create({first: "Katusha", last: "Norsister", email: "knorsister0@cam.ac.uk", phone: nil})
    Contact.create({first: nil, last: "Yonge", email: "syonge1@cafepress.com", phone: nil})
    Contact.create({first: "Jillane", last: nil, email: "jkenn2@dion.ne.jp", phone: nil})
    Contact.create({first: nil, last: nil, email: "labeles3@nymag.com", phone: "869-524-7244"})
    Contact.create({first: "Kirk", last: nil, email: "kfairbard4@issuu.com", phone: "460-805-7778"})
    Contact.create({first: "Ives", last: "Popplestone", email: "ipopplestone5@friendfeed.com", phone: nil})
    Contact.create({first: "Rad", last: nil, email: "rcrighton6@qq.com", phone: nil})
    Contact.create({first: nil, last: "Bing", email: "cbing7@techcrunch.com", phone: nil})
    Contact.create({first: "Marilin", last: "Klimas", email: "mklimas8@xinhuanet.com", phone: "706-964-8484"})
    Contact.create({first: "Kleon", last: "Whitby", email: "kwhitby9@blogtalkradio.com", phone: nil})
    Contact.create({first: "Tess", last: "Rollinson", email: "trollinsona@bravesites.com", phone: "688-751-4879"})
    Contact.create({first: "Andreas", last: nil, email: "akrolikb@jimdo.com", phone: "440-854-5139"})
    Contact.create({first: nil, last: "Piffe", email: "spiffec@reuters.com", phone: "643-116-5967"})
    Contact.create({first: "Tristan", last: nil, email: "tuccellid@dagondesign.com", phone: "980-835-8429"})
    Contact.create({first: nil, last: nil, email: "aspracklinge@shareasale.com", phone: nil})
    Contact.create({first: nil, last: nil, email: "mantonellif@nbcnews.com", phone: "479-314-4725"})
    Contact.create({first: nil, last: nil, email: "gmcquilleng@nytimes.com", phone: "993-233-0949"})
    Contact.create({first: "Bartholomeus", last: nil, email: "bfahyh@netlog.com", phone: nil})
    Contact.create({first: "Minni", last: "Crockley", email: "mcrockleyi@europa.eu", phone: nil})
    Contact.create({first: "Nap", last: nil, email: "nbrocksj@ebay.co.uk", phone: nil})
  end

  task "version" do
    puts Jennifer::Adapter.default_adapter.scalar <<-SQL
    SELECT
      version
    FROM
      migration_versions
    ORDER BY rowid DESC
    LIMIT 1
    SQL
  end
end

Sam.help
