---
title: Bind input to state with React Hooks
date: 2019-08-13
tags:
  - react
  - hooks
  - til
---

Used for _every_ React form, binding input to state is must have in your React toolbox. Now with hooks, easier than ever.

First we need to import React and useState hook.

```js
import React, { useState } from 'react'
```

After that we need to initialize state on top of functional component using useState hook.

```js
const [input, setInput] = useState('')
```

All that's left to do is to create input element with value of state and onChange method which will update state on every input change.

```jsx
<input type="text" value={input} onChange={e => setInput(e.target.value)} />
```

You can see how this works in [demo](https://bind-input-to-state.netlify.com/).

Full example code for reference:

```jsx
import React, { useState } from 'react'

const ExampleComponent = () => {
  const [input, setInput] = useState('')
  return (
    <div>
      <input
        type="text"
        value={input}
        onChange={e => setInput(e.target.value)}
        placeholder="type something"
      />
      <h1>{input}</h1>
    </div>
  )
}

export default ExampleComponent
```

### Resources

- [Bind input to state demo](https://bind-input-to-state.netlify.com/)
- [Bind input to state demo source code](https://github.com/bartol/bind-input-to-state-hooks)