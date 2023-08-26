class Db::Seed < LuckyTask::Task
  summary "Seed database"
  name "db.seed"

  def call
    AppDatabase.open do |db|
      db.transaction do |tx|
        c = tx.connection
        c.exec <<-SQL
        INSERT INTO contacts (first, last, email, phone, created_at, updated_at)
        VALUES
          ('John', 'Doe', 'john.doe@example.com', '123-456-7890', '2023-07-29T03:11:09Z', '2023-07-29T03:11:09Z'),
          ('John', 'Appleseed', 'john.appleseed@example.com', null, '2023-07-29T03:11:09Z', '2023-07-29T03:11:09Z'),
          (null, null, 'cladel0@about.com', null, '2023-07-29T03:11:09Z', '2023-07-29T03:11:09Z'),
          (null, null, 'mdoud1@so-net.ne.jp', '869-588-6121', '2023-07-05T13:16:23Z', '2023-07-05T13:16:23Z'),
          (null, 'Mayzes', 'mmayzes2@nytimes.com', '979-740-7077', '2023-08-12T18:28:03Z', '2023-08-12T18:28:03Z'),
          (null, 'Denyukhin', 'pdenyukhin3@scribd.com', null, '2023-05-17T19:05:11Z', '2023-05-17T19:05:11Z'),
          (null, 'Donald', 'cdonald4@nymag.com', null, '2023-03-31T20:39:50Z', '2023-03-31T20:39:50Z'),
          (null, null, 'agiffkins5@fema.gov', '793-343-7340', '2022-11-07T10:18:21Z', '2022-11-07T10:18:21Z'),
          ('Lara', null, 'lgorwood6@npr.org', '178-397-3956', '2022-11-29T01:49:53Z', '2022-11-29T01:49:53Z'),
          (null, null, 'hmarlen7@jimdo.com', '304-776-9172', '2022-11-20T03:45:37Z', '2022-11-20T03:45:37Z'),
          (null, 'Renad', 'mrenad8@foxnews.com', '568-816-6882', '2023-08-08T06:38:38Z', '2023-08-08T06:38:38Z'),
          ('Bertrand', null, 'bpuckinghorne9@about.me', null, '2022-09-12T02:09:19Z', '2022-09-12T02:09:19Z'),
          ('Min', null, 'mandriesa@globo.com', null, '2023-04-16T12:35:49Z', '2023-04-16T12:35:49Z'),
          (null, null, 'snorquoyb@fda.gov', null, '2023-03-05T19:53:01Z', '2023-03-05T19:53:01Z'),
          ('Regan', 'Becaris', 'rbecarisc@mapquest.com', null, '2023-01-26T14:58:23Z', '2023-01-26T14:58:23Z'),
          (null, 'Stonebridge', 'cstonebridged@yellowbook.com', '913-748-8136', '2022-12-23T14:30:12Z', '2022-12-23T14:30:12Z'),
          (null, null, 'cfruishe@irs.gov', null, '2023-03-23T18:42:54Z', '2023-03-23T18:42:54Z'),
          ('Leopold', 'Thompstone', 'lthompstonef@myspace.com', null, '2023-04-07T00:36:50Z', '2023-04-07T00:36:50Z'),
          (null, null, 'csiseyg@tripadvisor.com', '674-610-0045', '2023-07-22T18:59:07Z', '2023-07-22T18:59:07Z'),
          (null, 'Micheu', 'smicheuh@cbc.ca', '439-591-4445', '2022-08-30T08:44:16Z', '2022-08-30T08:44:16Z'),
          ('Hugibert', null, 'hkubali@umich.edu', null, '2023-06-29T06:51:43Z', '2023-06-29T06:51:43Z'),
          (null, null, 'kgerholdj@loc.gov', '782-868-5558', '2022-09-10T05:43:04Z', '2022-09-10T05:43:04Z'),
          ('Grady', 'Gowdy', 'ggowdyk@spiegel.de', null, '2023-02-16T01:36:11Z', '2023-02-16T01:36:11Z'),
          ('Milzie', 'Kyberd', 'mkyberdl@ucla.edu', null, '2022-10-31T08:21:18Z', '2022-10-31T08:21:18Z'),
          ('Eirena', null, 'egiacomellim@oakley.com', '946-162-6392', '2023-04-21T07:06:54Z', '2023-04-21T07:06:54Z'),
          ('Townsend', 'Hannam', 'thannamn@nasa.gov', '538-604-2516', '2023-07-29T13:28:08Z', '2023-07-29T13:28:08Z'),
          ('Sandi', null, 'somearao@forbes.com', null, '2023-07-22T18:32:14Z', '2023-07-22T18:32:14Z'),
          (null, 'Scalera', 'hscalerap@amazon.co.uk', null, '2023-04-05T14:08:01Z', '2023-04-05T14:08:01Z'),
          (null, null, 'apaxefordq@shinystat.com', null, '2022-10-01T04:58:33Z', '2022-10-01T04:58:33Z'),
          ('Gothart', null, 'gchaterr@psu.edu', '782-395-4088', '2023-03-31T03:59:11Z', '2023-03-31T03:59:11Z'),
          (null, null, 'agobbets@jimdo.com', '705-926-2378', '2023-03-12T22:38:28Z', '2023-03-12T22:38:28Z'),
          (null, null, 'nwildmant@addthis.com', '691-689-6275', '2022-12-24T07:01:17Z', '2022-12-24T07:01:17Z')
        SQL
      end
    end
  end
end
