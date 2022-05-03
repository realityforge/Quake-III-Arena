# Memory Management

There are multiple memory allocators used within idTech 3 (and presumably other idTech iterations).

* **Hunk Allocator**: This is used for large static allocations such as textures and geometry.
* **Zone Allocator**: This is used for smaller and possibly more volatile allocations.

Having multiple allocators is a common pattern in games. There are two reasons for this;

1) Most games will preallocate the memory they require and then perform their own allocations from that space. Not only can this be faster than using the OS allocator, but it stops the OS from paging your memory out to disk. Using your own allocator also makes it easier to create code to track memory patterns and leaks.

2) Keeping your small and/or dynamic allocations in a separate zone avoids fragmenting the zone that's used for larger allocations. Fragmentation is where previous small allocations have left "holes" that result in the amount of contiguous free space becoming smaller than total free space and is the bane of games who are pushing memory limits.

### Zone Allocator

The zone allocator allows allocation into multiple zones; the *main* zone and the *small* zone. The *main* zone is typical "dynamic" memory allocation while the *small* zone is used for tine allocations that would fragment the main zone (i.e. strings, cvars etc).

Each zone consists of a series of blocks in one continuous range of memory. Each block is annotated with metadata such as a tag, block size etc as well as references to the next and previous blocks. The tag is used to indicate the subsystem that allocated the block or is set to 0 to indicate that the block is un-allocated. Other metadata is present depending on compile time debug settings.

Each zone has a "rover" pointer that walks along block list to find a free block when allocation is attempted. When a free occurs, the tag for the block is marked as free, and the block is merged with the subsequent block if it is free. Thus, there will never be two contiguous free blocks.

The *small* zone is allocated as a fixed 5mb space while the *main* zone has a default allocation of 24 mb but this can be changed by setting the `com_zoneMegs` cvar on the command line.

### Hunk Allocator

The hunk allocator is designed to accommodate large static allocations that continue to be used until the hunk is cleared. The static allocations are typically for assets such as models, sounds and textures. The hunk is cleared when the map changes or when certain subsystems (i.e. the renderer) restart and require a reload of the assets. The goal of the allocator is to allow the restarting of the client without fragmentation, to minimize total pages in use at run time and to minimize total pages needed during load time.

The hunk allocator manages a single contiguous segment. Two stack allocators allocate from each end of the memory segment towards the middle. Each stack allocator maintains a highwater mark to indicate the maximum amount of memory used from each end of the memory segment since it was last cleared.

One stack allocator may be identified as a temporary memory allocator and temporary memory can be allocated or freed in any order. Temporary memory allocations must never be allocated on both allocators at once, or fragmentation could occur. When there is no temporary memory allocated, the permanent and temporary allocators can be switched, allowing the already touched temporary memory to be used for permanent storage. When an allocator needs to be selected to become a temporary memory allocator, the permanent allocator should be kept on the side that has the greatest gap between permanent allocations and highwater.

The subsystem requesting allocation can indicate a preference for which end the allocation occurs on. This preference is ignored if one ends is currently a temporary memory allocator. Analysis of the code indicates that the renderer preferences growing from the low end of the segment up and other subsystems preference allocator from the top end of the segment down. It is not entirely clear the motivation for this policy but it is surmised that after the game has been initialised, the temporary allocator is more likely to move towards allocating from the low end up. This would allow a future reimplementation of `realloc(...)` style functionality which is more likely to be used when working with temporary data. However, this is largely a guess.

The size of the hunk memory segment defaults to 128 mb with a minimum of either 1 mb for a dedicated server or 56 mb for an normal client. This can be controlled by setting the `com_hunkMegs` cvar on the command line.
