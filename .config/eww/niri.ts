import { $ } from 'bun';

const WORKSPACES: any = await $`niri msg -j workspaces`.json()
const WINDOWS: any = await $`niri msg -j windows`.json()
let output: {} = {workspaces: [], current_workspace: 0, window: ''}

for(let i: number = 0; i < WORKSPACES.length; i++) {
    output.workspaces.push(Math.floor(WORKSPACES[i].idx) - 1)
    if(WORKSPACES[i].is_active) output.current_workspace = Math.floor(WORKSPACES[i].idx) - 1
}

output.workspaces.sort()

for(let i: number = 0; i < WINDOWS.length; i++) {
    if(WINDOWS[i].is_focused) output.window = WINDOWS[i].title
}

console.log(JSON.stringify(output))
