# Bioformats2raw Conda Fork

This project is a fork of the original [bioformats2raw](https://github.com/glencoesoftware/bioformats2raw) repository, created to facilitate building and using the software within a Conda environment. The primary goal of this fork is to make the setup process easier and more accessible for users who prefer to work with Conda environments. Please note that this fork and its modifications are not affiliated with or endorsed by the original authors of the bioformats2raw project.

Please note that this fork is not the main project repository, and any issues or contributions related to the original codebase should be directed to the [original authors' project](https://github.com/glencoesoftware/bioformats2raw).

## About bioformats2raw

Bioformats2raw is a tool for converting image file formats supported by [Bio-Formats](https://www.openmicroscopy.org/bio-formats/) to raw binary or various compressed forms suitable for further processing, analysis, or visualization.

For more information, please refer to the original [README.md](https://github.com/glencoesoftware/bioformats2raw/blob/master/README.md) file in the original repository.

## Usage and Installation

Please follow the instructions provided in this repository for installing and using the bioformats2raw tool in a Conda environment. If you have any questions or issues related to the Conda-specific setup or usage, feel free to open an issue in this forked repository.

### 1. Create your conda enviornment

`$ conda env create -f environment.yml -n bioformats2raw`

### 2. Build the Jar and create the script to executing using Gradle

`$ ./gradlew clean shadowJar createBioformats2rawScript`

### 3. Run bioformats2raw

```
$ ./build/scripts/bioformats2raw 
Missing required parameters: '<inputPath>', '<outputLocation>'
Usage: <main class> [-p] [--keep-memo-files] [--no-hcs] [--[no-]minmax] [--[no-]
                    nested] [--no-ome-meta-export] [--no-root-group]
                    [--overwrite] [--use-existing-resolutions] [--version]
                    [--debug[=<logLevel>]] [--extra-readers[=<extraReaders>[,
                    <extraReaders>...]]]... [--options[=<readerOptions>[,
                    <readerOptions>...]]]... [-s[=<seriesList>[,
                    <seriesList>...]]]...
                    [--additional-scale-format-string-args=<additionalScaleForma
                    tStringArgsCsv>] [-c=<compressionType>]
                    [--dimension-order=<dimensionOrder>]
                    [--downsample-type=<downsampling>]
                    [--fill-value=<fillValue>] [-h=<tileHeight>]
                    [--max_cached_tiles=<maxCachedTiles>]
                    [--max_workers=<maxWorkers>]
                    [--memo-directory=<memoDirectory>]
                    [--pyramid-name=<pyramidName>] [-r=<pyramidResolutions>]
                    [--scale-format-string=<scaleFormatString>]
                    [--target-min-size=<minSize>] [-w=<tileWidth>]
                    [-z=<chunkDepth>]
                    [--compression-properties=<String=Object>]...
                    [--output-options=<String=String>[\|<String=String>...]]...
                    <inputPath> <outputLocation>
      <inputPath>            file to convert
      <outputLocation>       path to the output pyramid directory. The given
                               path can also be a URI (containing ://) which
                               will activate **experimental** support for
                               Filesystems. For example, if the output path
                               given is 's3://my-bucket/some-path' *and* you
                               have an S3FileSystem implementation in your
                               classpath, then all files will be written to S3.
      --additional-scale-format-string-args=<additionalScaleFormatStringArgsCsv>
                             Additional format string argument CSV file
                               (without header row).  Arguments will be added
                               to the end of the scale format string mapping
                               the at the corresponding CSV row index.  It is
                               expected that the CSV file contain exactly the
                               same number of rows as the input file has series
  -c, --compression=<compressionType>
                             Compression type for Zarr (null, zlib, blosc;
                               default: blosc)
      --compression-properties=<String=Object>
                             Properties for the chosen compression (see https:
                               //jzarr.readthedocs.io/en/latest/tutorial.
                               html#compressors )
      --debug, --log-level[=<logLevel>]
                             Change logging level; valid values are OFF, ERROR,
                               WARN, INFO, DEBUG, TRACE and ALL. (default: WARN)
      --dimension-order=<dimensionOrder>
                             Override the input file dimension order in the
                               output file [Can break compatibility with
                               raw2ometiff] (XYZCT, XYZTC, XYCTZ, XYCZT, XYTCZ,
                               XYTZC)
      --downsample-type=<downsampling>
                             Tile downsampling algorithm (SIMPLE, GAUSSIAN,
                               AREA, LINEAR, CUBIC, LANCZOS)
      --extra-readers[=<extraReaders>[,<extraReaders>...]]
                             Separate set of readers to include; (default:
                               [class com.glencoesoftware.bioformats2raw.
                               PyramidTiffReader, class com.glencoesoftware.
                               bioformats2raw.MiraxReader, class com.
                               glencoesoftware.bioformats2raw.BioTekReader,
                               class com.glencoesoftware.bioformats2raw.
                               ND2PlateReader])
      --fill-value=<fillValue>
                             Default value to fill in for missing tiles (0-255)
                               (currently .mrxs only)
  -h, --tile_height=<tileHeight>
                             Maximum tile height (default: 1024). This is both
                               the chunk size (in Y) when writing Zarr and the
                               tile size used for reading from the original
                               data. Changing the tile size may have
                               performance implications.
      --keep-memo-files      Do not delete .bfmemo files created during
                               conversion
      --max_cached_tiles=<maxCachedTiles>
                             Maximum number of tiles that will be cached across
                               all workers (default: 64)
      --max_workers=<maxWorkers>
                             Maximum number of workers (default: 4)
      --memo-directory=<memoDirectory>
                             Directory used to store .bfmemo cache files
      --no-hcs               Turn off HCS writing
      --[no-]minmax          Whether to calculate minimum and maximum pixel
                               values. Min/max calculation can result in slower
                               conversions. If true, min/max values are saved
                               as OMERO rendering metadata (true by default)
      --[no-]nested          Whether to use '/' as the chunk path separator
                               (true by default)
      --no-ome-meta-export   Turn off OME metadata exporting [Will break
                               compatibility with raw2ometiff]
      --no-root-group        Turn off creation of root group and corresponding
                               metadata [Will break compatibility with
                               raw2ometiff]
      --options[=<readerOptions>[,<readerOptions>...]]
                             Reader-specific options, in format key=value[,
                               key2=value2]
      --output-options=<String=String>[\|<String=String>...]
                             |-separated list of key-value pairs to be used as
                               an additional argument to Filesystem
                               implementations if used. For example,
                               --output-options=s3fs_path_style_access=true|...
                               might be useful for connecting to minio.
      --overwrite            Overwrite the output directory if it exists
      --pyramid-name=<pyramidName>
                             Name of pyramid (default: null) [Can break
                               compatibility with raw2ometiff]
  -r, --resolutions=<pyramidResolutions>
                             Number of pyramid resolutions to generate
  -s, --series[=<seriesList>[,<seriesList>...]]
                             Comma-separated list of series indexes to convert
      --scale-format-string=<scaleFormatString>
                             Format string for scale paths; the first two
                               arguments will always be series and resolution
                               followed by any additional arguments brought in
                               from `--additional-scale-format-string-args`
                               [Can break compatibility with raw2ometiff]
                               (default: %d/%d)
      --target-min-size=<minSize>
                             Specifies the desired size for the largest XY
                               dimension of the smallest resolution, when
                               calculating the number of resolutions generate.
                               If the target size cannot be matched exactly,
                               the largest XY dimension of the smallest
                               resolution should be smaller than the target
                               size.
      --use-existing-resolutions
                             Use existing sub resolutions from original input
                               format[Will break compatibility with raw2ometiff]
  -w, --tile_width=<tileWidth>
                             Maximum tile width (default: 1024). This is both
                               the chunk size (in X) when writing Zarr and the
                               tile size used for reading from the original
                               data. Changing the tile size may have
                               performance implications.
  -z, --chunk_depth=<chunkDepth>
                             Maximum chunk depth to read (default: 1)
  -p, --progress             Print progress bars during conversion
      --version              Print version information and exit
```


bioformats2raw converter
========================

Java application to convert image file formats, including .mrxs,
to an intermediate Zarr structure compatible with the OME-NGFF
specification.
The [raw2ometiff](https://github.com/glencoesoftware/raw2ometiff)
application can then be used to produce a
Bio-Formats 5.9.x ("Faas") or Bio-Formats 6.x (true OME-TIFF) pyramid.

Requirements
============

Java 8 or later is required.

libblosc (https://github.com/Blosc/c-blosc) version 1.9.0 or later must be installed separately.
The native libraries are not packaged with any relevant jars.  See also note in jzarr readme (https://github.com/bcdev/jzarr/blob/master/README.md)

 * macOS: `brew install c-blosc` then set `JAVA_OPTS=-Djna.library.path=$(echo $(brew --cellar c-blosc)/*/lib/)`
 * Windows: Pre-built blosc DLLs are available from the [Fiji project](https://sites.imagej.net/N5/lib/win64/).  Rename the downloaded DLL to `blosc.dll` and place in a fixed location then set `JAVA_OPTS="-Djna.library.path=C:\path\to\blosc\folder"`.
 * Ubuntu 18.04+: `apt-get install libblosc1`
 * conda: Installing `bioformats2raw` via conda (see below) will include `blosc` as a dependency.

__NOTE:__ If you are setting `jna.library.path` via the `JAVA_OPTS` environment variable, make sure the path is to the folder __containing__ the library not path to the library itself.

Installation
============

1. Download and unpack a release artifact:

    https://github.com/glencoesoftware/bioformats2raw/releases

2. OR, install via `conda` as described at [conda-bioformats2raw](https://github.com/ome/conda-bioformats2raw).

Development Installation
========================

1. Clone the repository:

    git clone https://github.com/glencoesoftware/bioformats2raw.git

2. Run the Gradle build as required, a list of available tasks can be found by running:

    ./gradlew tasks

Configuring Logging
===================

Logging is provided using the logback library. The `logback.xml` file in `src/dist/lib/config/` provides a default configuration for the command line tool.
In release and snapshot artifacts, `logback.xml` is in `lib/config/`.
You can configure logging by editing the provided `logback.xml` or by specifying the path to a different file:

    JAVA_OPTS="-Dlogback.configurationFile=/path/to/external/logback.xml" \
    bioformats2raw ...

Alternatively you can use the `--debug` flag, optionally writing the stdout to a file:

    bioformats2raw /path/to/file.mrxs /path/to/zarr-pyramid --debug > bf2raw.log

The `--log-level` option takes an [slf4j logging level](https://www.slf4j.org/faq.html#fatal) for additional simple logging configuration.
`--log-level DEBUG` is equivalent to `--debug`. For even more verbose logging:

    bioformats2raw /path/to/file.mrxs /path/to/zarr-pyramid --log-level TRACE

Eclipse Configuration
=====================

1. Run the Gradle Eclipse task:

    ./gradlew eclipse

2. Add the logback configuration in `src/dist/lib/config/` to your CLASSPATH.

Usage
=====

Run the conversion:

    bioformats2raw /path/to/file.mrxs /path/to/zarr-pyramid
    bioformats2raw /path/to/file.svs /path/to/zarr-pyramid

By default, the resolutions will be set so that the smallest resolution is no greater than 256x256.
The target of the smallest resolution can be configured with `--target-min-size` e.g. to ensure
that the smallest resolution is no greater than 128x128

    bioformats2raw /path/to/file.mrxs /path/to/zarr-pyramid --target-min-size 128
    bioformats2raw /path/to/file.svs /path/to/zarr-pyramid --target-min-size 128


Alternatively, the `--resolutions` options can be passed to specify the exact number of resolution levels:

    bioformats2raw /path/to/file.mrxs /path/to/zarr-pyramid --resolutions 6
    bioformats2raw /path/to/file.svs /path/to/zarr-pyramid --resolutions 6


Maximum tile dimensions can be configured with the `--tile_width` and `--tile_height` options.  Defaults can be viewed with
`bioformats2raw --help`. Be mindful of the downstream workflow when selecting a tile size other than the default.
A smaller than default tile size is rarely recommended.

If the input file has multiple series, a subset of the series can be converted by specifying a comma-separated list of indexes:

    bioformats2raw /path/to/file.scn /path/to/zarr-pyramid --series 0,2,3,4

By default, four additional readers (MiraxReader, PyramidTiffReader, BioTekReader, and ND2PlateReader) are added to the beginning of Bio-Formats' list of reader classes.
These readers are considered to be experimental and as a result only a limited range of input data is supported.

Any of these readers can be excluded with the `--extra-readers` option:

    # only include the reader for .mrxs
    bioformats2raw /path/to/file.tiff /path/to/zarr-pyramid --extra-readers com.glencoesoftware.bioformats2raw.MiraxReader
    # don't add any additional readers, just use the ones provided by Bio-Formats
    bioformats2raw /path/to/file.mrxs /path/to/zarr-pyramid --extra-readers

Reader-specific options can be specified using `--options`:

    bioformats2raw /path/to/file.mrxs /path/to/zarr-pyramid --options mirax.use_metadata_dimensions=false

Be aware when experimenting with different values for `--options` that the corresponding memo (cache) file may need to be
removed in order for new options to take effect.  This file will be e.g. `/path/to/.file.mrxs.bfmemo`.

The output in `/path/to/zarr-pyramid` can be passed to `raw2ometiff` to produce
an OME-TIFF that can be opened in ImageJ, imported into OMERO, etc. See
https://github.com/glencoesoftware/raw2ometiff for more information.

Output Formatting Options
=========================

By default, the output of `bioformats2raw` will be a
[Zarr dataset](https://zarr.readthedocs.io/en/stable/spec/v2.html) which follows the
metadata conventions defined by the
[OME-NGFF 0.4 specification](https://ngff.openmicroscopy.org/0.4/) including the
[bioformats2raw.layout specification](https://ngff.openmicroscopy.org/0.4/#bf2raw).

Several formatting options can be passed to the converter and will result in a Zarr dataset
that is not compatible with raw2ometiff and does not strictly follow the OME-NGFF
specification but may be suitable for other applications.

#### --pyramid-name

Specifies a subdirectory of the output directory where Zarr data should be written.
Using this option will insert another level into the output hierarchy, for example:

    $ bin/bioformats2raw --pyramid-name pyramid-test "test&sizeX=4096&sizeY&=4096&sizeZ=3.fake" example1
    $ tree example1
    example1/
    └── pyramid-test
        ├── 0
        │   ├── 0
               ...
        │   ├── 1
               ...
        │   ├── 2
               ...
        │   ├── 3
               ...
        │   └── 4
               ...
        └── OME
            └── METADATA.ome.xml

#### --scale-format-string

A [Java format string](https://docs.oracle.com/javase/8/docs/api/java/util/Formatter.html#syntax) that defines
how series and resolutions should be described in the output directory hierarchy.
The default value is `%d/%d`; the first argument supplied to the format string is the series index (from 0)
and the second argument is the resolution index (also from 0).

An example of removing the series index from the hierarchy altogether:

    $ bin/bioformats2raw --scale-format-string '%2$d/' "test&sizeX=4096&sizeY&=4096&sizeZ=3.fake" example2
    $ tree example2
    example2/
    ├── 0
       ...
    ├── 1
       ...
    ├── 2
       ...
    ├── 3
       ...
    ├── 4
    └── OME
        └── METADATA.ome.xml

Note the trailing `/` and quotes around the `--scale-format-string` argument.
Omitting the trailing `/` may cause an error, and single quotes are often necessary to prevent shell expansion.

#### --additional-scale-format-string-args

Specify a .csv file that contains additional information which can be used by `--scale-format-string`.
The .csv must contain one row per series, and must not contain a header row.
Each column will be passed as an additional argument when formatting the `--scale-format-string` argument.

An example .csv that defines a unique ID, acquisition date, and username for a series:

    $ cat example3.csv
    12345,2021-07-21,user_xyz

which can then be used to create a hierarchy by date, username, and ID:

    $ bin/bioformats2raw --additional-scale-format-string-args example3.csv --scale-format-string '%4$s/%5$s/%3$s/%1$d/%2$d' "test&sizeX=4096&size&=4096&sizeZ=3.fake" example3
    $ tree example3
    example3/
    ├── 2021-07-21
    │   └── user_xyz
    │       └── 12345
    │           └── 0
    │               ├── 0
                       ...
    │               ├── 1
                       ...
    │               ├── 2
                       ...
    │               ├── 3
                       ...
    │               └── 4
                       ...
    └── OME
        └── METADATA.ome.xml

#### --no-ome-meta-export

Prevents the input file's OME-XML metadata from being saved.  There will no longer be an `OME` directory
under the top-level output directory.

#### --no-root-group

By default, a Zarr group (`.zgroup` file) is written in the top-level output directory.
Adding the `--no-root-group` option prevents this group from being written.

Usage Changes
=============

Versions 0.2.6 and prior supported both N5 and Zarr output using the `--file_type` option.
This option is not present in 0.3.0 and later, as only Zarr output is supported.

Versions 0.2.6 and prior used the input file's dimension order to determine the output
dimension order, unless `--dimension-order` was specified.
Version 0.3.0 uses the `TCZYX` order by default, for compatibility with https://ngff.openmicroscopy.org/0.2/#image-layout.
The `--dimension-order` option can still be used to set a specific output dimension order, e.g.:

    bioformats2raw /path/to/file.mrxs /path/to/zarr-pyramid --dimension-order XYCZT

or can be set to use the input file's ordering, preserving the behavior of 0.2.6:

    bioformats2raw /path/to/file.mrxs /path/to/zarr-pyramid --dimension-order original

If a specific dimension order is passed to `--dimension-order`, it must be a valid dimension order as defined in
the [OME 2016-06 schema](https://www.openmicroscopy.org/Schemas/Documentation/Generated/OME-2016-06/ome_xsd.html#Pixels_DimensionOrder).
The specified dimension order is then reversed when creating Zarr arrays, e.g. `XYCZT` would become `TZCYX` in Zarr.

Prior to version 0.3.0, N5/Zarr output was placed in a subdirectory (`data.[n5|zarr]`) with a `METADATA.ome.xml` file
at the same level.  As of 0.3.0 the desired output directory is now a Zarr group and the `METADATA.ome.xml` file is
placed in a `OME` directory within.  These changes reflect layout version 3.

Prior to version 0.5.0, the plate and series Zarr groups followed the metadata defined in
the [0.2 version of the OME-NGFF specification](https://ngff.openmicroscopy.org/0.2). As of
0.5.0, these groups now follow the metadata conventions defined in the
[0.4 version of the OME-NGFF specification](https://ngff.openmicroscopy.org/0.4). Additionally,
the layout of the top-level Zarr group is now part of the upstream specification - see
https://ngff.openmicroscopy.org/0.4/#bf2raw and the `OME` directory containing the
`METADATA.ome.xml` file is now a Zarr group.

Versions 0.5.0 and later write [OMERO rendering metadata](https://ngff.openmicroscopy.org/0.4/#omero-md)
by default. This includes calculating the minimum and maximum pixel values for the entire image.
We recommend keeping this metadata for maximum compatibility with downstream applications, but it can
be omitted by using the `--no-minmax` option.

Performance
===========

This package is __highly__ sensitive to underlying hardware as well as
the following configuration options:

 * `--max_workers`
 * `--tile_width`
 * `--tile_height`

On systems with significant I/O bandwidth, particularly SATA or
NVMe based storage, you may find sharply diminishing returns with high
worker counts.  There are significant performance gains to be had utilizing
larger tile sizes but be mindful of the consequences on the downstream
workflow. Smaller tile sizes than the default are rarely recommended.

The worker count defaults to the number of detected CPUs.  This may or may not be appropriate for the chosen input data.
If reading a single tile from the input data requires a lot of memory, decreasing the worker count will be necessary
to prevent memory exhaustion.  JPEG, PNG, and certain TIFFs are especially susceptible to this problem.

The worker count should be set to 1 if the input data requires a Bio-Formats reader that is not thread-safe.
This is not a common case, but is a known issue with Imaris HDF data in particular.

In general, expect to need to tune the above settings and measure
relative performance.

Metadata caching
================

During conversion, a temporary `.*.bfmemo` file will be created. By default, this file is in the same directory as the input data
and will be removed after the conversion finishes. The location of the `.*.bfmemo` file can be configured using the `--memo-directory` option:

    bioformats2raw /path/to/file.mrxs /path/to/zarr-pyramid --memo-directory /tmp/

This is particularly helpful if you do not have write permissions in the input data directory.

As of version 0.5.0, `.*.bfmemo` files are deleted at the end of conversion by default. We do not recommend keeping these files for normal
conversions, but if they are needed for troubleshooting then the `--keep-memo-files` option can be used.

License
=======

The converter is distributed under the terms of the GPL license.
Please see `LICENSE.txt` for further details.
