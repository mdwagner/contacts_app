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
          ('John', 'Doe', 'john.doe@example.com', '123-456-7890', '2023-07-29T03:11:09Z', '2023-06-05T04:27:21Z'),
          ('John', 'Appleseed', 'john.appleseed@example.com', null, '2023-07-29T03:11:09Z', '2023-06-05T04:27:21Z'),
          (null, null, 'cladel0@about.com', null, '2023-07-29T03:11:09Z', '2023-06-05T04:27:21Z'),
          (null, null, 'mdoud1@so-net.ne.jp', '869-588-6121', '2023-07-05T13:16:23Z', '2023-02-05T05:04:03Z'),
          (null, 'Mayzes', 'mmayzes2@nytimes.com', '979-740-7077', '2023-08-12T18:28:03Z', '2023-01-11T09:58:49Z'),
          (null, 'Denyukhin', 'pdenyukhin3@scribd.com', null, '2023-05-17T19:05:11Z', '2023-01-26T05:08:49Z'),
          (null, 'Donald', 'cdonald4@nymag.com', null, '2023-03-31T20:39:50Z', '2022-09-20T02:10:31Z'),
          (null, null, 'agiffkins5@fema.gov', '793-343-7340', '2022-11-07T10:18:21Z', '2022-09-05T08:22:10Z'),
          ('Lara', null, 'lgorwood6@npr.org', '178-397-3956', '2022-11-29T01:49:53Z', '2023-03-09T21:09:21Z'),
          (null, null, 'hmarlen7@jimdo.com', '304-776-9172', '2022-11-20T03:45:37Z', '2023-02-12T07:44:57Z'),
          (null, 'Renad', 'mrenad8@foxnews.com', '568-816-6882', '2023-08-08T06:38:38Z', '2023-03-11T09:31:32Z'),
          ('Bertrand', null, 'bpuckinghorne9@about.me', null, '2022-09-12T02:09:19Z', '2023-06-07T01:16:18Z'),
          ('Min', null, 'mandriesa@globo.com', null, '2023-04-16T12:35:49Z', '2023-07-21T10:51:12Z'),
          (null, null, 'snorquoyb@fda.gov', null, '2023-03-05T19:53:01Z', '2023-05-12T01:25:56Z'),
          ('Regan', 'Becaris', 'rbecarisc@mapquest.com', null, '2023-01-26T14:58:23Z', '2023-07-10T06:53:35Z'),
          (null, 'Stonebridge', 'cstonebridged@yellowbook.com', '913-748-8136', '2022-12-23T14:30:12Z', '2022-10-25T14:02:01Z'),
          (null, null, 'cfruishe@irs.gov', null, '2023-03-23T18:42:54Z', '2022-09-17T12:01:12Z'),
          ('Leopold', 'Thompstone', 'lthompstonef@myspace.com', null, '2023-04-07T00:36:50Z', '2022-11-05T20:10:30Z'),
          (null, null, 'csiseyg@tripadvisor.com', '674-610-0045', '2023-07-22T18:59:07Z', '2023-05-02T23:43:55Z'),
          (null, 'Micheu', 'smicheuh@cbc.ca', '439-591-4445', '2022-08-30T08:44:16Z', '2022-09-17T00:53:34Z'),
          ('Hugibert', null, 'hkubali@umich.edu', null, '2023-06-29T06:51:43Z', '2022-11-05T02:03:06Z'),
          (null, null, 'kgerholdj@loc.gov', '782-868-5558', '2022-09-10T05:43:04Z', '2023-06-21T21:58:07Z'),
          ('Grady', 'Gowdy', 'ggowdyk@spiegel.de', null, '2023-02-16T01:36:11Z', '2023-02-03T11:40:23Z'),
          ('Milzie', 'Kyberd', 'mkyberdl@ucla.edu', null, '2022-10-31T08:21:18Z', '2022-11-05T11:14:28Z'),
          ('Eirena', null, 'egiacomellim@oakley.com', '946-162-6392', '2023-04-21T07:06:54Z', '2023-01-17T14:37:31Z'),
          ('Townsend', 'Hannam', 'thannamn@nasa.gov', '538-604-2516', '2023-07-29T13:28:08Z', '2023-05-26T02:04:54Z'),
          ('Sandi', null, 'somearao@forbes.com', null, '2023-07-22T18:32:14Z', '2022-11-12T18:08:37Z'),
          (null, 'Scalera', 'hscalerap@amazon.co.uk', null, '2023-04-05T14:08:01Z', '2023-06-19T22:31:59Z'),
          (null, null, 'apaxefordq@shinystat.com', null, '2022-10-01T04:58:33Z', '2023-02-07T03:32:06Z'),
          ('Gothart', null, 'gchaterr@psu.edu', '782-395-4088', '2023-03-31T03:59:11Z', '2023-01-08T00:25:10Z'),
          (null, null, 'agobbets@jimdo.com', '705-926-2378', '2023-03-12T22:38:28Z', '2023-06-06T17:00:37Z'),
          (null, null, 'nwildmant@addthis.com', '691-689-6275', '2022-12-24T07:01:17Z', '2022-12-27T05:23:29Z')
        SQL
      end
    end
  end
end
