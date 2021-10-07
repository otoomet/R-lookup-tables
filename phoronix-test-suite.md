# Phoronix test suite

## Running tests

## Manage results

* `list-saved-results` lists the saved results, first the name (id) of
  the test run (in bold), and thereafter the name of the test
  collection.  If you just run a single test then these two will be
  the same.  But if you re-run someones else's test, then these are different.
  
* `remove-result`  If
  you want to remove the results you need the first, the id.

Results are stored in folder

`.phoronix-test-suite/test-results/<name-of-the-system>/composite.xml`


## How to create a personal phoronix test suite

```bash
phoronix-test-suite build-suite
```

Asks name, type (system/processor/...)

What is a good test type?  Processor seems too narrow.

Subtests: have to pick from a long list, and can select parameters.
Fills out the test in
`.phoronix-test-suite/test-suites/local/<suite-name>` as an _Execute_
element with tags _Test_ (test name), _Arguments_ and _Description_.
```xml
  <Execute>
    <Test>pts/openarena-1.5.5</Test>
    <Arguments>+set r_customWidth 1920 +set r_customHeight 1080</Arguments>
    <Description>Resolution: 1920 x 1080</Description>
  </Execute>
```
**_Description_ is necessary for the test to obey the arguments**.
Description is printed at the beginning of the test run, you can
change its content, but if the field is not there, it will run through
all test parameters.


The test suite definition is located in
`.phoronix-test-suite/test-suites/local/<suite-name>` and called
`suite-definition.xml`.  It looks like
```xml
<?xml version="1.0"?>
<!--Phoronix Test Suite v10.4.0-->
<PhoronixTestSuite>
  <SuiteInformation>
    <Title>general-pc-test</Title>
    <Version>1.0.1</Version>
    <TestType>Processor</TestType>
    <Description>A smallish general test containing single and multiple core tasks, and graphics</Description>
    <Maintainer>Ott Toomet</Maintainer>
    <PreRunMessage></PreRunMessage>
    <PostRunMessage></PostRunMessage>
    <RunMode></RunMode>
  </SuiteInformation>
  <Execute>
    <Test>pts/x265-1.3.0</Test>
    <Mode>BATCH</Mode>
  </Execute>
  ...
</PhoronixTestSuite>
```



When you have are ready with the test suite, you can upload it to
openbenchmarking as

```bash
phoronix-test-suite upload-test-suite local/general-pc-test
```

### Rebuilding?

_Rebuild_ is supposed to validate the xml but it messes up the
arguments, and adds
```
<RequiresCoreVersionMin></RequiresCoreVersionMin>
<RequiresCoreVersionMax></RequiresCoreVersionMax>
```
into the file, and now this refuses to upload to openbenchmarking. 

It also changed _Mode_ to _BATCH_ and removed the arguments, so all my
subtest selection was gone.

#### Run the test

```bash
phoronix-test-suite rebuild-test-suite local/general-pc-test
```
