# Multiple Future handling

Lets take an example where you can select multiple items in a list and then you select download to start downloading all of the selected files. 

## Normal Async await in a loop

On the right you'll see code that stores a list of `filedIdsToDownload`. Then there's a function called `downloadAllFiles` that should complete **when all the files are downloaded**. The goal is to only complete this function when all files have been downloaded.

## Your Turn

Given all the Future knowledge you've acquired, loop over each file id in a for loop, call the future and `await` on it. 

---

<!-- Maybe trim this down to 3 files that takes <5 seconds to complete? Maybe that's just the monkey brain talking though... -->
When you run this code the output should look like below and it took 13 seconds to complete. 

```
download complete for: http://downloaded.fileid=123 at 2022-04-10 13:53:47.732
download complete for: http://downloaded.fileid=324 at 2022-04-10 13:53:50.981
download complete for: http://downloaded.fileid=534 at 2022-04-10 13:53:56.328
download complete for: http://downloaded.fileid=121 at 2022-04-10 13:53:57.544
download complete for: http://downloaded.fileid=22 at 2022-04-10 13:53:57.770
download complete for: http://downloaded.fileid=232 at 2022-04-10 13:54:00.097
download complete for: http://downloaded.fileid=34 at 2022-04-10 13:54:00.441
Notify user all dowloads are complete!
```

The reason it took 13 seconds is because each future ran "syncrhonously", meaning the next future will only run when the current one completes, which kind of defeats the purpose. In the next step you'll make this code run 2x faster!

