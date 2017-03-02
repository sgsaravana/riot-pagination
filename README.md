# riot-pagination
Simple pagination-ui plugin with RiotJS

# Usage

```html
<riot-pagination
  show         = "{ participants.length }"
  current-page = "{ currentPage }"
  per-page     = "{ perPage }"
  page-changed = "{ switchPage }"
  page-count   = "{ pageCount }"
  record-count = "{ recordCount }"
  max-buttons  = "8"
  show-first   = "true"
  show-last    = "true"
  show-next    = "true"
  show-prev    = "true">
</riot-pagination>
```

#### current-page
Current active page (default: 1)

#### per-page
No of items per page (default: 10)

#### page-changed
function to be executed when the page is changed

#### page-count
No of total pages

#### record-count
Total number of records

#### max-buttons
Maximum number of page buttons to show (default: 8)

#### show-first
Show the 'First' page button (default: true)

#### show-last
Show the 'Last' page button (default: true)

#### show-next
Show 'Next' button (default: true)

#### show-prev
Show 'Previous' button (default: true)

